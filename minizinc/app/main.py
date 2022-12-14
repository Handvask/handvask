import os
from os.path import dirname

import requests
from dotenv import load_dotenv
from fastapi import Body, FastAPI, HTTPException
from kubernetes import client, config
from utils import create_job, delete_job, configure

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
    job = create_job(BATCHV1, test_problem, test_data, test_solvers, "test")

    if job:
        return {"message": "Succesfully started job", "name": job.metadata.name}

    return {"message": "Couldn't create job", "name": ""}


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
    if not delete_job( BATCHV1, id ):
        raise HTTPException( 500, "Couldn't delete job" )
    return {"message": "Successfully deleted job"}


@app.post("/result")
def result(
    id: str = Body(), solution: str = Body(), status: str = Body(), time: int = Body()
):
    delete_job(BATCHV1, id)
    requests.post(
        BACKEND_URL + "/result",
        json={"id": id, "solution": solution, "status": status, "time": time},
        headers=HEADERS,
    )


@app.post("/error")
def error(id: str = Body(), error: str = Body()):
    delete_job(BATCHV1, id)
    requests.post(
        BACKEND_URL + "/error", json={"id": id, "error": error}, headers=HEADERS
    )
