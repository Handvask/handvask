FROM python as minizinc-app

RUN mkdir /app

WORKDIR /app

COPY ./requirements.txt /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./utils.py /app

COPY ./main.py /app

EXPOSE 5000

CMD [ "python", "main.py" ]
