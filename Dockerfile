FROM python:3.10-alpine
RUN apk update
RUN apk add --no-cache \
    mariadb-connector-c-dev \
    mariadb-dev \
    build-base \
    libffi-dev \
    python3-dev \
    gcc \
    musl-dev \
    && apk add --no-cache --virtual .build-deps \
    build-base python3-dev mariadb-dev
ENV _syserr_cb=noexcept
RUN pip install --upgrade pip setuptools wheel
COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN pip install gevent==23.7.0 --only-binary=:all:
COPY ./requirements-prod.txt .
RUN pip install -r requirements-prod.txt
RUN apk del python3-dev mariadb-dev build-base
COPY ./site /app
COPY ./tests.py /app
WORKDIR /app
ENV SUPER_USER_NAME=admin
ENV SUPER_USER_EMAIL=admin@example.com
ENV SUPER_USER_PASSWORD=adminpassword

RUN DJANGO_SUPERUSER_PASSWORD=$SUPER_USER_PASSWORD 
RUN python manage.py makemigrations 
RUN python manage.py migrate 
RUN python manage.py collectstatic --no-input
RUN python manage.py createsuperuser --username $SUPER_USER_NAME --email $SUPER_USER_EMAIL --noinput
