from datetime import datetime
from os import getenv
from typing import List, Optional

import requests
from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select, desc

from ..middleware.auth import get_current_user_id
from ..Models import (
    Dzn_instance,
    Mzn_instance,
    Run,
    Run_status,
    RunT,
    Solver,
    SuccessT,
    User,
)

router = APIRouter(
    prefix="/runs",
    tags=["Runs"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


class create_runT(SuccessT):
    id: int


@router.post("/create", response_model=create_runT)
@db_session
def create_run(
    user_id: int = Depends(get_current_user_id),
    mzn_id: int = Body(),
    dzn_id: Optional[int] = Body(default=None),
    solvers: List[int] = Body(),
):
    mzn = Mzn_instance[mzn_id]
    dzn = None
    if not mzn or mzn.user.id != user_id:
        raise HTTPException(401, "Access denied")
    if dzn_id:
        dzn = Dzn_instance[dzn_id]
        if not dzn or dzn.user.id != user_id:
            raise HTTPException(401, "Access denied")
    db_solvers = select(s for s in Solver if s.id in solvers)[:]
    if not len(db_solvers) == len(
        solvers
    ):  # One or more of the specified solvers is invalid
        raise HTTPException(401, "Access denied")
    run = Run(
        user=user_id,
        solvers=db_solvers,
        mzn_instance=mzn,
        dzn_instance=dzn,
        status=Run_status.SUBMITTED,
    )
    commit()
    resp = requests.post(
        f"{getenv('MZN_MN_HOST')}/solve",
        json={
            "id": run.id,
            "problem": mzn.contents,
            "data": "" if not dzn else dzn.contents,
            "solvers": [solver.name for solver in db_solvers],
        },
    )
    if resp.ok:
        run.start_time = datetime.now()
        run.status = Run_status.RUNNING
    else:
        run.end_time = datetime.now()
        run.status = Run_status.EXCEPTION
        run.result = resp.text
    return {"success": resp.ok, "id": run.id}


@router.get("", response_model=List[RunT])
@db_session
def get_runs(user_id=Depends(get_current_user_id), run_ids: List[int] = Query(None)):
    """Fetches runs from the database given a list of IDs

    Args:
        user_id (int, optional): The user_id of the currently logged in user
        run_ids (List[int], optional): A list of instance ids

    Raises:
        HTTPException: Instance not found
        HTTPException: Access denied

    Returns:
        List[RunT]: A list of runs
    """
    runs = select(r for r in Run if r.id in run_ids).order_by(desc(Run.id))[:]

    res = []
    for run in runs:
        if run.user.id != user_id and not bool(User[user_id].sys_admin):
            raise HTTPException(status_code=401, detail="Access denied")
        res.append(run.get_resp_type())
    return res


@router.post("/delete/{run_id}", response_model=SuccessT)
@db_session
def delete_run(run_id: int, user_id=Depends(get_current_user_id)):
    try:
        run = Run[run_id]
    except:
        raise HTTPException(status_code=404, detail=f"Run {run_id} not found")

    if run.user.id != user_id and not bool(User[user_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")

    if run.status.id == Run_status.RUNNING:
        resp = requests.post(
            f"{getenv('MZN_MN_HOST')}/delete",
            json=run.id,
        )

        if resp.ok:
            run.delete()
        print(resp)
        return {"success": resp.ok}
    else:
        run.delete()
        return {"success": True}
