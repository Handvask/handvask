import argparse
import asyncio
import base64

import requests

import minizinc as mz

MASTER_URL = "http://minizinc-app-service:8383"

result = {}


async def find_solutions(inst: mz.Instance):
    async for r in inst.solutions():
        if r is None:
            continue

        # inform master node that a feasible solution has been found
        if result.get("status", None) is None and r.status.has_solution():
            requests.post(MASTER_URL + "/progress", json=result)

        result["status"] = r.status.name

        if r.solution:
            result["solution"] = str(r.solution)
            print(r.solution)
            print("-" * 10)
        elif r.status.has_solution():
            result["time"] = r.statistics.get("solveTime").microseconds
            print("=" * 10)
        else:
            result["solution"] = ("=" * 5) + r.status.name + ("=" * 5)
            print("=" * 5, r.status.name, "=" * 5, sep="")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Give the id for the run and the solver this job should use."
    )
    parser.add_argument(
        "id", metavar="ID", type=str, action="store", help="The id of the run"
    )
    parser.add_argument(
        "solver",
        metavar="SOLVER",
        type=str,
        action="store",
        help="The solver used by this job",
    )

    config = parser.parse_args()

    result["id"] = config.id
    result["solver"] = config.solver

    try:
        instance = mz.Instance(mz.Solver.lookup(config.solver.strip()), mz.Model())

        with open("/input/model.b64.mzn", "r") as f:
            instance.add_string(
                base64.b64decode(f.read().encode("ascii")).decode("utf8")
            )

        with open("/input/data.b64.dzn", "r") as f:
            instance.add_string(
                base64.b64decode(f.read().encode("ascii")).decode("utf8")
            )

        asyncio.run(find_solutions(instance))

    except Exception as e:
        result["status"] = type(e)
        result["solution"] = str(e)

    requests.post(MASTER_URL + "/result", json=result)
