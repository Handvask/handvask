# Simple flask app in python which solves minizinc instances sent in json format

To run a local example build the image
    docker build . -t app
run a container
    docker run -p 5000:5000 app
then, in a different terminal, do the following curl to start solving a test instance
    curl -X POST -H "Content-Type: application/json" -d '{"model": "int: n; var int: x; constraint x = n; solve satisfy;", "data": "n = 2;", "solver": "gecode"}' http://127.0.0.1:5000/solve
the status/result of which can be gotten from the following curl
    curl -X GET http://127.0.0.1:5000/result
