FROM python:3.10

WORKDIR /server

COPY ./requirements.txt /server/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /server/requirements.txt

COPY ./app /server/app

COPY ./gen_key.sh /server/gen_key.sh

RUN bash /server/gen_key.sh

COPY ./.env /server/.env

COPY ./start.sh /server/start.sh

CMD ["bash", "/server/start.sh"]