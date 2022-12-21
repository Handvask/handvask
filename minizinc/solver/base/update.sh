cd "$( dirname "$0" )"

docker build . -t jonasplesner/minizinc:latest

docker push jonasplesner/minizinc:latest