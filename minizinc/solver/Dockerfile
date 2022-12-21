FROM jonasplesner/minizinc AS minizinc-solver

RUN apt-get update -y

RUN apt-get install -y python3.11

RUN apt-get install -y pip

RUN pip install --upgrade pip

WORKDIR /solver

COPY requirements.txt /solver/

RUN pip install -r requirements.txt

COPY main.py /solver/
