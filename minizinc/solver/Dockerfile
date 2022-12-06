FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

RUN mkdir /solver

WORKDIR /solver

COPY ./requirements.txt /solver

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./main.py /solver

EXPOSE 5000

CMD ["python", "main.py"]
