from datetime import datetime
from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select

from ..middleware.api_key import check_api_key
from ..Models import Run, Run_status, Solver, Run_Solver

router = APIRouter(
    prefix="/minizinc",
    tags=["Minizinc"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.post("/progress", response_model=str)
@db_session
def progress(key=Depends(check_api_key), id: str = Body(), solver: str = Body()):
    run = Run[id]
    solver = select(s for s in Solver if s.name == solver)[:][0]
    if not solver:
        print("oh fuck oh no wrong solver supplied")
        exit()

    if run.status != Run_status.DONE:
        run.status = Run_status.PROVING_OPTIMALITY
        run.best_solver = solver
        run_solver: Run_Solver = run.run__solvers.select(
            lambda s: s.id == solver.id)
        if not run_solver:
            print("oh fuck oh no wrong solver supplied")
            exit()
        run_solver.progress = "JA"

    return "ok"


# test for correctness
@router.post("/result", response_model=str)
@db_session
def get_solvers(
    key=Depends(check_api_key),
    id: str = Body(),
    solver: str = Body(),
    status: str = Body(),
    solution: str = Body(),
    time: Optional[int] = Body(default=None),
):
    run = Run[id]
    optimal = not time is None

    solver = select(s for s in Solver if s.name == solver)[:][0]
    if not solver:
        print("oh fuck oh no wrong solver supplied")
        exit()

    if run.status != Run_status.DONE:
        run.status = Run_status.DONE if optimal else Run_status.EXCEPTION
        run.end_time = datetime.now()
        run.best_solver = solver
        run.execution_time = time if optimal else 0
        run.mzn_status = status
        run.result = solution

    # handles situations were multiple solvers finish at around the same time
    elif optimal and time < run.execution_time:
        run.execution_time = time
        run.best_solver = solver

    return "ok"
