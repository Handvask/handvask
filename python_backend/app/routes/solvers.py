from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select

from ..middleware.auth import get_current_user_id
from ..Models import SuccessT, User, Dzn_instance, Mzn_instance, Solver, SolverT


router = APIRouter(
    prefix="/solvers",
    tags=["Solvers"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.get("/", response_model=List[SolverT])
@db_session
def get_solvers(user_id: int = Depends(get_current_user_id)):
    if not user_id:
        raise HTTPException(status_code=401, detail="Access denied")
    solvers = select(s for s in Solver)[:]

    return [s.to_dict() for s in solvers]
