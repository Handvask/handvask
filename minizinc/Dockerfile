FROM python as minizinc-app

RUN mkdir /app

WORKDIR /app

COPY ./app/requirements.txt /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./app/main.py /app

EXPOSE 5000

CMD ["python", "main.py"]


FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

RUN mkdir /solver

WORKDIR /solver

COPY ./solver/requirements.txt /solver

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./solver/main.py /solver

EXPOSE 5000

CMD ["python", "main.py"]