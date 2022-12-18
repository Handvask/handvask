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


@router.post( "/progress", response_model=str )
@db_session
def progress(
    id: str = Body(),
    solver: str = Body()
):
    run = Run[id]

    if run.status != Run_status.DONE:
        # TODO: there should be a status, like 'PROVING_OPTIMALITY', for when a non-optimal solution has been found (project.md line 91)
        run.status = Run_status.RUNNING
        # TODO: set solver

    return "ok"


# test for correctness
@router.post("/result", response_model=str)
@db_session
def get_solvers(
    key=Depends(check_api_key),
    id: str = Body(),
    solver: str = Body(), # TODO: it should be visible to the user which solver solved the problem (project.md line 96)
    status: str = Body(),
    solution: str = Body(),
    time: Optional[int] = Body( default=None )
):
    run = Run[id]
    optimal = not time is None

    if run.status != Run_status.DONE:
        run.status = Run_status.DONE if optimal else Run_status.EXCEPTION
        run.end_time = datetime.now()
        # TODO: set solver
        run.execution_time = time if optimal else 0
        run.mzn_status = status
        run.result = solution

    # handles situations were multiple solvers finish at around the same time
    elif optimal and time < run.execution_time:
        # TODO: set solver
        run.execution_time = time

    return "ok"