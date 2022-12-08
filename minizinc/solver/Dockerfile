FROM python as minizinc-solver

RUN apt-get update -y

RUN apt-get install -y minizinc

COPY . ./solver

RUN mkdir /solver

WORKDIR /solver

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./solver/main.py /solver

CMD ["python", "main.py"]
