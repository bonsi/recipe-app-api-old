FROM python:3.7-alpine

LABEL maintainer="bonsi"

ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN python -m pip install --upgrade pip
# if we run pip install as a regular user, stuff like django-admin.py are installed under the user and not accessible in the PATH
RUN pip install -r requirements.txt

# RUN adduser -D user
# USER user

WORKDIR /app
COPY ./app .

RUN adduser -D user
USER user
