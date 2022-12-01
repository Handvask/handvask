import requests
from flask import Flask

app = Flask(__name__)

config.load_incluster_config()
COREV1 = client.CoreV1Api()
BATCHV1 = client.BatchV1Api()

test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];"
test_data = "i = 10;"
test_solvers = ["gecode", "gist"]


@app.route("/", methods=["GET"])
def hello():
    return "Hello World!", 200


@app.route("/solve", methods=["GET"])
def solve():
    return (
        requests.post(
            solving_url,
            json={"problem": test_problem, "data": test_data, "solver": test_solver},
            headers={"Content-Type": "application/json"},
        ).content,
        200,
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
