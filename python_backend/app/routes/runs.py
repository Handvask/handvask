from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import db_session, select, commit

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
import requests
from os import getenv
from datetime import datetime

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
    runs = select(r for r in Run if r.id in run_ids)[:]

    res = []
    for run in runs:
        if run.user.id != user_id and not bool(User[user_id].sys_admin):
            raise HTTPException(status_code=401, detail="Access denied")
        res.append(run.get_resp_type())
    return res
