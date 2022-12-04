# Simple version of minizinc solver that can spawn jobs to solve instances
With docker and kubernetes set up properly can be started locally by running
    bash deploy.sh
which starts a webhost which should be exposed on port 6000 with the possible paths being:
    POST /solve
    GET /result
    GET /delete
Currently only a single job can exist at a time and the /solve just solves a hardcoded example
