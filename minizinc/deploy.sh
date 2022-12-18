kubectl delete deployments --all
kubectl delete jobs --all
docker compose build
kubectl apply -f k8s/deployment.yaml
kubectl set image deployment minizinc-app minizinc-app=handvask-minizinc-image