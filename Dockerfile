FROM ghcr.io/pablo-moreno/gunicorn-docker:0.1.1

COPY . /code

RUN apt-get update && \
    apt-get install -y gcc vim postgresql-client && \
    apt-get remove --purge --auto-remove -y

RUN pip install -r requirements.txt
