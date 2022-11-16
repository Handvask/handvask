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