FROM python:3.10

WORKDIR /server

COPY ./requirements.txt /server/requirements.txt

RUN pip install --upgrade pip --quiet

RUN pip install --no-cache-dir --upgrade --default-timeout=100 -r /server/requirements.txt --quiet

COPY ./app /server/app

COPY ./gen_key.sh /server/gen_key.sh

RUN bash /server/gen_key.sh

# COPY ./.env /server/.env

COPY ./start.sh /server/start.sh

# CMD [ "curl", "-i", "http://host.docker.internal:8383/" ]

CMD ["bash", "/server/start.sh"]
