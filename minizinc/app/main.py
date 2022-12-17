import os
from os.path import dirname

import requests
from dotenv import load_dotenv
from fastapi import Body, FastAPI, HTTPException
from kubernetes import client, config
from utils import create_job, delete_job, list_jobs, JOBNAME

load_dotenv(dirname(__file__) + "/.env")

app = FastAPI()

# configure(os.getenv("HOST_URL"), os.getenv("CACERT"), os.getenv("TOKEN"))
config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

BACKEND_URL = os.getenv("BACKEND_HOST")
HEADERS = {"X-Api-Key": os.getenv("API_KEY")}
SOLVER_NAME = os.getenv("SOLVER_IMAGE")

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];"
test_data = "i = 10;"
test_solvers = ["gecode", "gist"]


@app.get("/")
def hello():
    return {"message": "Hello from minizinc-app!!!!!!"}


@app.post("/test")
def test():
    if not create_job(BATCHV1, test_problem, test_data, test_solvers, "test", SOLVER_NAME):
        raise HTTPException(500, "Couldn't create job")

    return {"message": "Succesfully started job"}


# TODO: should have problem, data, and solvers posted
@app.post("/solve")
def solve(
    id: str = Body(),
    problem: str = Body(),
    data: str = Body(),
    solvers: list[str] = Body(),
):
    print("Creating job")
    job = create_job(BATCHV1, problem, data, solvers, id, SOLVER_NAME)
    print("Job created")
    if not job:
        raise HTTPException(500, "Couldn't create job")

    return {"message": "Succesfully started job"}


@app.post("/delete")
def delete(
    id: str = Body()
):
    jobs = list_jobs( BATCHV1, id )

    if jobs is None:
        raise HTTPException( 400, "Couldn't find jobs with given id" )

    for job in jobs.items:
        if not delete_job( BATCHV1, job.metadata.name ):
            raise HTTPException( 500, "Couldn't delete one or more jobs" )

    return {"message": "Successfully deleted jobs"}


@app.post("/delete/solver")
def delete_solver(
    id: str = Body(),
    solver: str = Body()
):
    if not delete_job( BATCHV1, JOBNAME(id, solver) ):
        raise HTTPException( 500, "Couldn't delete job" )

    return {"message": "Successfully deleted job"}


@app.post("/result")
def result(
    id: str = Body(), solver: str = Body(), solution: str = Body(), status: str = Body(), time: int = Body()
):
    jobs = list_jobs( BATCHV1, id )

    if jobs:
        for job in jobs.items:
            delete_job( BATCHV1, job.metadata.name )

    requests.post(
        BACKEND_URL + "/result",
        json={"id": id, "solver": solver, "solution": solution, "status": status, "time": time},
        headers=HEADERS,
    )


@app.post("/error")
def error(id: str = Body(), solver: str = Body(), status: str = Body()):
    jobs = list_jobs( BATCHV1, id )

    if jobs:
        for job in jobs.items:
            delete_job( BATCHV1, job.metadata.name )

    requests.post(
        BACKEND_URL + "/error", json={"id": id, "solver": solver, "status": status}, headers=HEADERS
    )
