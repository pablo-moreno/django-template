FROM ghcr.io/pablo-moreno/gunicorn-docker:0.1.1

COPY . /code

RUN pip install -r requirements.txt
