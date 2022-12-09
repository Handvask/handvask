kubectl delete all --all
docker build -t minizinc-app:latest --target minizinc-app ./app
kubectl apply -f deployment.yaml