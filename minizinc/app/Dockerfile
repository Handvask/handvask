FROM python as minizinc-app

WORKDIR /app

ARG API_KEY
ARG BACKEND_HOST
ARG SOLVER_IMAGE
ARG HOST_URL
ARG CACERT
ARG TOKEN

COPY prepare.sh /app/prepare.sh

RUN sh /app/prepare.sh

COPY main.py /app/

COPY utils.py /app/

COPY requirements.txt /app/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

# COPY ./.env /app/.env

EXPOSE 5000

CMD [ "uvicorn", "main:app", "--host=0.0.0.0", "--port=5000" ]
