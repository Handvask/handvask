FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

WORKDIR /solver

COPY main.py /solver/

COPY requirements.txt /solver/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt