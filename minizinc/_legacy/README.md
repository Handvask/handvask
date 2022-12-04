# Local kubernetes cluster which allows a test minizinc instance to be solved

With docker and local kubernetes running (I use docker desktop for both) run:
    bash deploy.sh
to create two pods, where one can be accessed through:
    curl -X GET http://localhost:6000/solve
to have it send a request to the other pod to have it calculate a minizinc instance and return its result (if not using docker desktop the url might be different)