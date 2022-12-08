FROM python as minizinc-app

WORKDIR /app

COPY main.py /app/

COPY utils.py /app/

COPY requirements.txt /app/

COPY .env /app/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "uvicorn", "main:app", "--host=0.0.0.0", "--port=5000" ]
