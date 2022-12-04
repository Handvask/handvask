import os
import asyncio
import minizinc as mz


async def find_solutions( inst: mz.Instance ):
    s = None
    async for r in inst.solutions():
        if r is None:
            continue

        if r.solution:
            s = r.solution
            print( r )
            print( "-"*10 )
        elif r.status.has_solution():
            print( { "solution": s, "status": r.status.name, "time": r.statistics.get( "solveTime" ).total_seconds() } )
            print( "="*10 )
        else:
            print( "="*5, r.status.name, "="*5, sep="" )


if __name__ == '__main__':
    solver: str
    with open( '/input/solvers.txt', 'r' ) as f:
        solver = f.read().splitlines()[int(os.getenv( 'JOB_COMPLETION_INDEX' ))]
    
    instance = mz.Instance( mz.Solver.lookup( solver.strip() ), mz.Model() )
    instance.add_file( '/input/model.mzn' )
    instance.add_file( '/input/data.dzn' )
    
    #instance = mz.Instance( mz.Solver.lookup( 'gecode' ), mz.Model() )
    #instance.add_string( "int: i; array[1..2] of var 0..i: x; constraint x[1] < i /\ x[2] < i; solve maximize x[1] + x[2];" )
    #instance.add_string( "i = 10;" )

    asyncio.run( find_solutions( instance ) )