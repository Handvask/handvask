import os
import base64
from tempfile import NamedTemporaryFile
from flask import Flask
from kubernetes import client, config

from utils import create_job, get_result, delete_job

app = Flask(__name__)

config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];"
test_data = "i = 10;"
test_solvers = ["gecode", "gist"]

job: client.V1Job

@app.route( "/solve", methods=["POST"] )
def solve():
    global job

    job = create_job( BATCHV1, test_problem, test_data, test_solvers )

    return (f'\nSuccesfully created job: {job.metadata.name}', 200) if job else (f"\nCouldn't create job", 400)


@app.route( "/result", methods=["GET"] )
def result():
    return get_result( COREV1, job )


@app.route( "/delete", methods=["GET"] )
def delete():
    global job

    if delete_job( BATCHV1, job ):
        job = None
        return '\nDeleted job!', 200

    return "\nCouldn't delete job", 400


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


if __name__ == '__main__':
    #configure()
    app.run(host="0.0.0.0", port=5000)
