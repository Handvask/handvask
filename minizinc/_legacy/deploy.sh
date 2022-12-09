docker build -t minizinc-app:latest --target minizinc-app .
docker build -t minizinc-solver:latest --target minizinc-solver .
kubectl apply -f deployment.yaml