#!/bin/bash

ASGI_HOST=${WSGI_HOST:='0.0.0.0'}
ASGI_PORT=8000
ASGI_WORKERS=${WSGI_WORKERS:=1}
WORKER_NUM_PROCESSES=${WORKER_NUM_PROCESSES:=1}

service nginx restart

poetry run uvicorn --workers $ASGI_WORKERS --host $ASGI_HOST --port $ASGI_PORT config.asgi:application
