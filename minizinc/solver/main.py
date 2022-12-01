import asyncio
from threading import Event, Lock, Thread

from flask import Flask, jsonify, request

import minizinc as mz

app = Flask(__name__)

# test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve :: int_search( x, input_order, indomain_min ) maximize x[1] + x[2];"
# test_data = "i = 10000;"
# test_solver = "gecode"

threads: list[Thread] = []
solution: mz.Result = None
cancelled = Event()
lock = Lock()


@app.route("/", methods=["POST", "GET"])
def solve_and_return():
    try:
        content = request.json
        inst = mz.Instance(mz.Solver.lookup(content.get("solver")), mz.Model())
        inst.add_string(content.get("problem"))
        inst.add_string(content.get("data"))
        return jsonify(inst.solve().solution), 200
    except Exception as e:
        return f"Couldn't solve, got exception: {e}", 400



@app.route("/solve", methods=["POST"])
def solve():
    try:
        content = request.json
        threads.clear()
        cancelled.clear()
        for solver in content.get("solvers"):
            threads.append(
                Thread(
                    target=start_solving,
                    args=(content.get("model"), content.get("data"), solver),
                )
            )
        for t in threads:
            t.start()
    except:
        return "Couldn't start solving", 400
    else:
        return "Started solving", 200


@app.route("/cancel", methods=["GET"])
def cancel():
    cancelled.set()
    return "Cancelled solving", 200


@app.route("/result", methods=["GET"])
def result():
    if solution is None:
        if len(threads) > 0:
            return "No solutions found yet", 200
        else:
            return "Nothing is executing", 400

    if solution.status not in [mz.Status.OPTIMAL_SOLUTION, mz.Status.SATISFIED]:
        if cancelled.isSet():
            return f"Solving was cancelled with the status: {solution.status.name}", 200
        else:
            return (
                f"Still solving, with the current status: {solution.status.name}",
                200,
            )

    return jsonify(solution.solution), 200


def start_solving(problem: str, data: str, solver: str):
    inst = mz.Instance(mz.Solver.lookup(solver), mz.Model())
    inst.add_string(problem)
    inst.add_string(data)
    inst.method
    asyncio.run(find_solutions(inst))


async def find_solutions(inst: mz.Instance):
    global solution

    async for result in inst.solutions():
        if cancelled.is_set():
            break

        if result is None:
            continue

        if result.solution:
            solution = result
        else:
            solution.status = result.status
            solution.statistics = result.statistics


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
