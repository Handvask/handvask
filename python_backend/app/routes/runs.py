from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import db_session, select

from ..middleware.api_key import check_api_key
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


@router.post("/create", response_model=SuccessT)
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
    Run(
        user=user_id,
        solvers=db_solvers,
        mzn_instance=mzn,
        dzn_instance=dzn,
        status=Run_status.SUBMITTED,
    )
    return {"success": True}


@router.get("secure_path", response_model=SuccessT)
def test(key=Depends(check_api_key)):
    """Just a test to see if API_key is working

    Args:
        key (None, optional): Defaults to Depends(check_api_key).

    Returns:
        SuccessT: A success response
    """
    print(key)
    return {"success": True}


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
