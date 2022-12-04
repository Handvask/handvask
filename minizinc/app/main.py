import os
import base64
from tempfile import NamedTemporaryFile
from flask import Flask, jsonify
from kubernetes import client, config

from utils import create_job, delete_job, list_pods, log_pod

app = Flask(__name__)

config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];"
test_data = "i = 10;"
test_solvers = ["gecode", "gist"]

job: client.V1Job

# TODO: should have problem, data, and solvers posted
@app.route("/solve", methods=["POST"])
def solve():
    global job

    job = create_job(BATCHV1, test_problem, test_data, test_solvers)

    if job:
        result = {
            "job_name": job.metadata.name,
            "job_label": job.metadata.labels["controller-uid"],
        }
        return jsonify(result), 202

    return "\nCouldn't create job", 500


# TODO: should have label of job to retrieve result from posted
@app.route("/result", methods=["POST"])
def result():
    pods = list_pods(COREV1, job)
    if pods is None:
        return "\nCouldn't get job", 400

    for pod in pods.items:
        result = log_pod(COREV1, pod)
        if result:
            result = result.splitlines()
            if result[-1] == "=" * 10:
                return jsonify(result[-2]), 200
            elif result[-1] == "-" * 10:
                return f"\nGot intermediate result: {result[-2]}", 200
            else:
                return f"\nGot error: {result[-1]}", 200

    return "\nCouldn't get result", 500


# TODO: should have name of job to delete posted
@app.route("/delete", methods=["POST"])
def delete():
    global job

    if delete_job(BATCHV1, job):
        job = None
        return "\nDeleted job!", 200

    return "\nCouldn't delete job", 400


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
        print(f"Got exception while configuring: {e}")


if __name__ == "__main__":
    # configure()
    app.run(host="0.0.0.0", port=5000)
