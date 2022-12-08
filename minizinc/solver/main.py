import os
import argparse
import asyncio
import requests
import minizinc as mz

MASTER_URL = "http://minizinc-app-service:8383"

result = {}
solved: bool = False

async def find_solutions( inst: mz.Instance ):
    global solved

    s = ""
    async for r in inst.solutions():
        if r is None:
            continue

        if r.solution:
            s = r
            print(r.solution)
            print("-" * 10)
        elif r.status.has_solution():
            solved = True
            result['solution'] = str(s)
            result['status'] = r.status.name
            result['time'] = r.statistics.get( "solveTime" ).microseconds
            print( "="*10 )
        else:
            result["status"] = r.status.name
            print("=" * 5, r.status.name, "=" * 5, sep="")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Give the id for the job.')
    parser.add_argument( "id", metavar="ID", type=str, action='store', help="The id of the job" )

    config = parser.parse_args()

    solver: str
    try:
        f = open( '/input/solvers.txt', 'r' )
        solver = f.read().splitlines()[int(os.getenv( 'JOB_COMPLETION_INDEX' ))]
    except:
        requests.post( MASTER_URL + "/error", json={"id": config.id, "error": "Couldn't get solver"} )

    instance = mz.Instance( mz.Solver.lookup( solver.strip() ), mz.Model() )
    instance.add_file( '/input/model.mzn' )
    instance.add_file( '/input/data.dzn' )
    """
    instance = mz.Instance( mz.Solver.lookup( 'gecode' ), mz.Model() )
    instance.add_string( 'int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];' )
    instance.add_string( "i = 10;" )
    """
    try:
        asyncio.run( find_solutions( instance ) )
    except Exception as e:
        requests.post( MASTER_URL + "/error", json={"id": config.id, "error": str(e)} )

    result["id"] = config.id

    if not solved:
        requests.post( MASTER_URL + "/error", json=result )

    requests.post( MASTER_URL + "/result", json=result )
