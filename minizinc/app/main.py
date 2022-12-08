import os
from os.path import dirname
from dotenv import load_dotenv
import base64
import requests
from tempfile import NamedTemporaryFile
from kubernetes import client, config
from fastapi import FastAPI, Body

from utils import create_job, delete_job

load_dotenv(dirname(__file__) + ".env")

app = FastAPI()

config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

BACKEND_URL = 'https://handvask-giawyejmea-lz.a.run.app/minizinc'
HEADERS = { "X-Api-Key": os.getenv( "API-KEY" ) }

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];"
test_data = "i = 10;"
test_solvers = ["gecode", "gist"]

@app.get( "/" )
def hello():
    return {"message": "Hello from minizinc-app!"}


@app.post( "/test" )
def test():
    job = create_job( BATCHV1, test_problem, test_data, test_solvers, "test" )

    if job:
        return {"message": "Succesfully started job", "name": job.metadata.name}

    return {"message": "Couldn't create job", "name": ""}

# TODO: should have problem, data, and solvers posted
@app.post( "/solve" )
def solve( id: str = Body(), problem: str = Body(), data: str = Body(), solvers: list[str] = Body() ):
    job = create_job( BATCHV1, problem, data, solvers, id )

    if job:
        return {"message": "Succesfully started job", "name": job.metadata.name}

    return {"message": "Couldn't create job", "name": ""}


@app.post( "/result" )
def result( id: str = Body(), solution: str = Body(), status: str = Body(), time: float = Body() ):
    delete_job( BATCHV1, id )
    requests.post( BACKEND_URL + "/result", json={ "id": id, "solution": solution, "status": status, "time": time }, headers=HEADERS )


@app.post( "/error" )
def error( id: str = Body(), error: str = Body() ):
    delete_job( BATCHV1, id )
    requests.post( BACKEND_URL + "/error", json={ "id": id, "error": error }, headers=HEADERS )


# TODO: look at later
def configure():
    try:
        host_url = os.environ["HOST_URL"]
        cacert = os.environ["CACERT"]
        token = os.environ["TOKEN"]

        # Set the configuration
        configuration = client.Configuration()
        with NamedTemporaryFile(delete=False) as cert:
            cert.write(base64.b64decode(cacert))
            configuration.ssl_ca_cert = cert.name
        configuration.host = host_url
        configuration.verify_ssl = True
        configuration.debug = False
        configuration.api_key = {"authorization": "Bearer " + token}
        client.Configuration.set_default(configuration)

    except Exception as e:
        print( f'Got exception while configuring: {e}' )