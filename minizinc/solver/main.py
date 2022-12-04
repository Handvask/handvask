import os
import minizinc as mz

if __name__ == '__main__':
    solver: str
    with open( '/input/solvers.txt', 'r' ) as f:
        solver = f.read().splitlines()[int(os.getenv( 'JOB_COMPLETION_INDEX' ))]
    
    instance = mz.Instance( mz.Solver.lookup( solver.strip() ), mz.Model() )
    instance.add_file( '/input/model.mzn' )
    instance.add_file( '/input/data.dzn' )
    
    sol = instance.solve()
    
    print( sol.solution )
