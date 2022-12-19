import argparse
import asyncio
import base64

import requests

import minizinc as mz

MASTER_URL = "http://minizinc-app-service:8383"

result = {}

def result2string( result: mz.Result, variables: list[str], obj: bool = False, json: bool = False ):
    data = { v: result[v] for v in variables if result[v] }

    if obj:
        data["objective"] = result.objective

    if json:
        return str( data )
    
    return "\n".join( f"{k} = {v};" for k, v in data.items() )


async def find_solutions( inst: mz.Instance, obj: bool, json: bool, p: int, a: bool ):
    inst.analyse()
    variables = [ k for k in inst.output.keys() if k != "_checker" ]

    if a:
        result["solution"] = ""

    async for r in inst.solutions( processes=p, intermediate_solutions=True ):
        if r is None:
            continue

        # inform master node that a feasible solution has been found
        if result.get("status", None) is None and r.status.has_solution():
            requests.post(MASTER_URL + "/progress", json=result)

        result["status"] = r.status.name

        if r.solution:
            if a:
                result["solution"] += result2string( r, variables, obj, json )
                result["solution"] += "\n" + "-"*10 + "\n"
            else:
                result["solution"] = r
            print(r.solution)
            print("-" * 10)
        elif r.status.has_solution():
            if a:
                result["solution"] += "="*10
            else:
                result["solution"] = result2string( result["solution"], variables, obj, json )
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
        "-o", "--objective", action="store_true",
        help="Whether the objective should be output"
    )
    parser.add_argument( 
        "-j", "--json", action="store_true",
        help="Whether the output should be in json format"
    )
    parser.add_argument(
        "-p", "--processors", metavar="PROCESSORS", type=int, action="store",
        help="The number of processors which should be used", default=1
    )
    parser.add_argument(
        "-a", "--all", action="store_true", 
        help="Whether all optimal/intermediate solutions should be returned (only intermediate works)"
    )
    parser.add_argument(
        "id", metavar="ID", type=str, action="store",
        help="The id of the run"
    )
    parser.add_argument(
        "solver", metavar="SOLVER", type=str, action="store",
        help="The solver used by this job"
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

        asyncio.run(
            find_solutions(
                instance, 
                config.objective,
                config.json,
                config.processors,
                config.all
            )
        )

    except Exception as e:
        result["status"] = type(e)
        result["solution"] = str(e)

    requests.post(MASTER_URL + "/result", json=result)
