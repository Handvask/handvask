import asyncio
from multiprocessing import Process
from threading import Event, Thread

from flask import Flask, Response, jsonify, request

import minizinc as mz

app = Flask(__name__)

# test_problem = "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve :: int_search( x, input_order, indomain_min ) maximize x[1] + x[2];"
# test_data = "i = 10000;"
# test_solver = "gecode"

solving: Thread = None
cancelled: Event = Event()
solution: mz.Result = None


@app.route("/solve", methods=["POST"])
def solve():
    global solving

    try:
        content = request.json
        cancelled.clear()
        solving = Thread(
            target=start_solving,
            args=(content.get("model"), content.get("data"), content.get("solver")),
        )
        solving.start()
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
        if solving.is_alive():
            return "No solutions found yet", 200
        else:
            return "Nothing is executing", 400

    if solution.status not in [mz.Status.OPTIMAL_SOLUTION, mz.Status.SATISFIED]:
        if not solving.is_alive():
            return f"Solving has stopped with the status: {solution.status.name}", 200
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
