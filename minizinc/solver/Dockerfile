FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

RUN pip install --upgrade pip

WORKDIR /solver

COPY requirements.txt /solver/

RUN pip install -r requirements.txt

COPY main.py /solver/
