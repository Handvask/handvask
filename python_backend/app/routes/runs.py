from datetime import datetime
from os import getenv
from typing import List, Optional

import requests
from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, desc, select

from ..middleware.auth import get_current_user_id
from ..Models import (
    Dzn_instance,
    Mzn_instance,
    Run,
    Run_Solver,
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
    flag_json: Optional[bool] = Body(default=False),
    flag_objective: Optional[bool] = Body(default=False),
    flag_all: Optional[bool] = Body(default=False),
    flag_processors: Optional[int] = Body(default=1),
    flag_timeout: Optional[int] = Body(default=None),
    flag_memory: Optional[int] = Body(default=None),
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
    user = User[user_id]

    if (
        len(solvers) * flag_processors
        + sum(
            [
                len(run.run__solvers.select(lambda runSolver: not runSolver.terminated))
                * run.flag_processors
                for run in select(
                    run
                    for run in Run
                    if run.status.id
                    in (Run_status.RUNNING, Run_status.PROVING_OPTIMALITY)
                    and run.user.id == user_id
                )[:]
            ]
        )
        >= user.max_cpu
    ):
        raise HTTPException(403, "Quota full")
    run = Run(
        user=user,
        mzn_instance=mzn,
        dzn_instance=dzn,
        status=Run_status.SUBMITTED,
        flag_all=flag_all,
        flag_json=flag_json,
        flag_objective=flag_objective,
        flag_processors=flag_processors,
    )
    commit()
    for solver in db_solvers:
        Run_Solver(solver=solver, run=run, terminated=False)
    resp = requests.post(
        f"{getenv('MZN_MN_HOST')}/solve",
        json={
            "id": run.id,
            "problem": mzn.contents,
            "data": "" if not dzn else dzn.contents,
            "solvers": [solver.name for solver in db_solvers],
            "all": flag_all,
            "json": flag_json,
            "objective": flag_objective,
            "processors": flag_processors,
            "timeout": flag_timeout,
            "memory": flag_memory,
        },
    )
    print(
        {
            "id": run.id,
            "problem": mzn.contents,
            "data": "" if not dzn else dzn.contents,
            "solvers": [solver.name for solver in db_solvers],
            "all": flag_all,
            "json": flag_json,
            "objective": flag_objective,
            "processors": flag_processors,
            "timeout": flag_timeout,
            "memory": flag_memory,
        }
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
@router.post("/terminate")
@db_session
def terminate_run(
    user_id: int = Depends(get_current_user_id),
    run_id: int = Body(),
    solver_ids: Optional[list[int]] = Body(default=None),
):
    run = Run[run_id]
    admin = User[user_id].sys_admin
    solvers = (
        [
            solver.solver.name
            for solver in run.run__solvers
            if solver.solver.id in solver_ids
        ]
        if solver_ids
        else None
    )

    if run.user.id != user_id and not admin:
        raise HTTPException(401, "Access denied")

    resp = requests.post(
        f"{getenv('MZN_MN_HOST')}/delete", json={"id": run_id, "solvers": solvers}
    )

    if resp.ok:
        if not solvers or len(solvers) == len(
            run.run__solvers.select(lambda run_solver: not run_solver.terminated)
        ):
            run.end_time = datetime.now()
            run.status = (
                Run_status[Run_status.TERMINATED_USER]
                if not admin
                else Run_status[Run_status.TERMINATED_ADMIN]
            )
            for runSolver in run.run__solvers:
                runSolver.terminated = True
        else:
            for runSolver in run.run__solvers.select(
                lambda s: s.solver.id in solver_ids
            ):
                runSolver.terminated = True

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
    runs = select(r for r in Run if r.id in run_ids).order_by(desc(Run.id))[:]

    res = []
    for run in runs:
        if run.user.id != user_id and not bool(User[user_id].sys_admin):
            raise HTTPException(status_code=401, detail="Access denied")
        res.append(run.get_resp_type())
    return res


@router.post("/delete/{run_id}", response_model=SuccessT)
@db_session
def delete_run(
    run_id: int,
    user_id=Depends(get_current_user_id),
):
    try:
        run = Run[run_id]
    except:
        raise HTTPException(status_code=404, detail=f"Run {run_id} not found")

    if run.user.id != user_id and not bool(User[user_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")
    if (
        run.status.id == Run_status.RUNNING
        or run.status.id == Run_status.PROVING_OPTIMALITY
    ):
        resp = requests.post(
            f"{getenv('MZN_MN_HOST')}/delete",
            json={
                "id": run.id,
                "solvers": None,
            },
        )

        if resp.ok:
            run.delete()
        return {"success": resp.ok}
    run.delete()
    return {"success": True}
