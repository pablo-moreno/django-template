FROM python:3.11-slim-buster

RUN mkdir /code

WORKDIR /code

COPY . /code

RUN apt-get update && \
    apt-get install -y gcc vim postgresql-client nginx && \
    apt-get remove --purge --auto-remove -y

COPY nginx/nginx.conf /etc/nginx/sites-enabled/default

RUN pip install poetry && poetry install && poetry run python manage.py collectstatic --noinput

CMD [ "bash", "./scripts/run.sh" ]
