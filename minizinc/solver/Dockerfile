<<<<<<<< HEAD:minizinc/solver/Dockerfile
FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

COPY . ./solver

RUN mkdir /solver

WORKDIR /solver

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./solver/main.py /solver
========
FROM python

RUN apt-get update -y

RUN apt-get install -y minizinc

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY main.py /app

EXPOSE 5000

CMD ["python", "main.py"]
>>>>>>>> main:minizinc/Dockerfile

CMD ["python", "main.py"]