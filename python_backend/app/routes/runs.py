from datetime import datetime
from os import getenv
from typing import List, Optional

import requests
from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select

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


# TODO: test for correctness
@router.post( "/terminate" )
@db_session
def terminate_run(
    user_id: int = Depends(get_current_user_id),
    run_id: int = Body(),
    solvers: Optional[list[int]] = Body( default=None )
):
    run = Run[run_id]
    admin = User[user_id].sys_admin
    solvers = [ solver.name for solver in run.solvers if solvers is None or solver in solvers ]

    if run.user.id != user_id and not admin:
        raise HTTPException(401, "Access denied")

    resp = requests.post(
        f"{getenv('MZN_MN_HOST')}/delete",
        json={
            "id": run_id,
            "solvers": solvers
        }
    )

    if resp.ok:
        # TODO: make it so it's possible to tell if a run is fully terminated even if done over multiple calls
        # (e.g. there are 3 solvers and first one call terminates 1 and then another terminates the remaining 2)
        if len(solvers) == len(run.solvers):
            run.end_time = datetime.now()
            run.status = Run_status.TERMINATED_USER if not admin else Run_status.TERMINATED_ADMIN

    return {"success": resp.ok, "id": run_id, "solvers": solvers}


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
