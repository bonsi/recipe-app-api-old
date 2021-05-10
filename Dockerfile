FROM python:3.7-alpine

LABEL maintainer="bonsi"

ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN python -m pip install --upgrade pip

RUN adduser -D user
USER user

RUN pip install -r requirements.txt

WORKDIR /app
COPY ./app .

# RUN adduser -D user
# USER user
