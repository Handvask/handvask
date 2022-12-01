# Local kubernetes cluster which allows a test minizinc instance to be solved

With docker and local kubernetes running (I use docker desktop for both) run:
bash deploy.sh
to create two pods, where one can be accessed through:
curl -X GET http://localhost:6000/solve
to have it send a request to the other pod to have it calculate a minizinc instance and return its result (if not using docker desktop the url might be different)
To run a local example build the image
docker build . -t app
run a container
docker run -p 5000:5000 app
then, in a different terminal, do the following curl to start solving a test instance
curl -X POST -H "Content-Type: application/json" -d '{"model": "int: n; var int: x; constraint x = n; solve satisfy;", "data": "n = 2;", "solver": "gecode"}' http://127.0.0.1:5000/solve
the status/result of which can be gotten from the following curl
curl -X GET http://127.0.0.1:5000/result
