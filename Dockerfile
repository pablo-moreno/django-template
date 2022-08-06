FROM python:3.10-slim-buster

RUN mkdir /code

WORKDIR /code

COPY . /code

RUN apt-get update && \
    apt-get install -y gcc vim postgresql-client && \
    apt-get remove --purge --auto-remove -y

RUN pip install poetry && poetry install && poetry run python manage.py collectstatic --noinput

CMD [ "bash", "./scripts/run.sh" ]
