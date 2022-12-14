from datetime import datetime
from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select

from ..middleware.api_key import check_api_key
from ..Models import Run, Run_status

router = APIRouter(
    prefix="/minizinc",
    tags=["Minizinc"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.post("/error", response_model=str)
@db_session
def get_solvers(
    key=Depends(check_api_key),
    id: str = Body(),
    status: str = Body(),
):
    run = Run[id]
    run.status = Run_status.EXCEPTION
    run.end_time = datetime.now()
    run.result = status
    run.execution_time = 0
    return "ok"


@router.post("/result", response_model=str)
@db_session
def get_solvers(
    key=Depends(check_api_key),
    id: str = Body(),
    solution: str = Body(),
    status: str = Body(),
    time: int = Body(),
):
    run = Run[id]
    run.result = solution
    run.status = Run_status.DONE
    run.end_time = datetime.now()
    run.mzn_status = status
    run.execution_time = time

    return "ok"
