import os
from os.path import dirname
from typing import Optional

import requests
from dotenv import load_dotenv
from fastapi import Body, FastAPI, HTTPException
from kubernetes import client, config
from utils import JOBNAME, create_jobs, delete_jobs, list_jobs

load_dotenv(dirname(__file__) + "/.env")

app = FastAPI()

# configure(os.getenv("HOST_URL"), os.getenv("CACERT"), os.getenv("TOKEN"))
config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

BACKEND_URL = os.getenv("BACKEND_HOST")
HEADERS = {"X-Api-Key": os.getenv("API_KEY")}
SOLVER_NAME = os.getenv("SOLVER_IMAGE")

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve :: int_search( x, input_order, indomain_min ) maximize x[1] + x[2];"
test_data = "i = 1000;"
test_solvers = ["gecode", "gist"]


@app.get("/")
def hello():
    return {"message": "Hello from minizinc-app!!!!!!"}


@app.post("/test")
def test():
    if not create_jobs(
        BATCHV1,
        test_problem,
        test_data,
        test_solvers,
        "test",
        SOLVER_NAME,
        True,
        True,
        2,
        True,
    ):
        raise HTTPException(500, "Couldn't create one or more jobs")

    return {"message": "Succesfully started jobs"}


# TODO: should have problem, data, and solvers posted
@app.post("/solve")
def solve(
    id: str = Body(),
    problem: str = Body(),
    data: str = Body(),
    solvers: list[str] = Body(),
    objective: Optional[bool] = Body(default=False),
    json: Optional[bool] = Body(default=False),
    processors: Optional[int] = Body(default=1),
    all: Optional[bool] = Body(default=False),
):
    if not create_jobs(
        BATCHV1,
        problem,
        data,
        solvers,
        id,
        SOLVER_NAME,
        objective,
        json,
        processors,
        all,
    ):
        raise HTTPException(500, "Couldn't create one or more jobs")

    return {"message": "Succesfully started jobs"}


@app.post("/delete")
def delete(id: str = Body(), solvers: Optional[list[str]] = Body(default=None)):
    names: list[str]

    if solvers is None:
        jobs = list_jobs(BATCHV1, id)

        if jobs is None:
            raise HTTPException(400, "Couldn't find jobs with given id")

        names = [job.metadata.name for job in jobs.items]

    else:
        names = [JOBNAME(id, solver) for solver in solvers]

    if not delete_jobs(BATCHV1, names):
        raise HTTPException(500, "Couldn't delete one or more jobs")

    return {"message": "Successfully deleted jobs"}


@app.post("/progress")
def progress(id: str = Body(), solver: str = Body()):
    requests.post(
        BACKEND_URL + "/progress",
        json={"id": id, "solver": solver},
        headers=HEADERS,
        timeout=30,
    )


@app.post("/result")
def result(
    id: str = Body(),
    solver: str = Body(),
    status: str = Body(),
    solution: str = Body(),
    time: Optional[int] = Body(default=None),
):
    jobs = list_jobs(BATCHV1, id)

    if jobs:
        delete_jobs(BATCHV1, [job.metadata.name for job in jobs.items])

    requests.post(
        BACKEND_URL + "/result",
        json={
            "id": id,
            "solver": solver,
            "status": status,
            "solution": solution,
            "time": time,
        },
        headers=HEADERS,
        timeout=30,
    )
