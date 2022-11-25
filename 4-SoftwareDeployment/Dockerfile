FROM postgres
LABEL description="Test Docker for PostgreSQL"
LABEL mainteiner="Kebap Dmytro, pkebap10@gmail.com"
LABEL version="1.0"

ENV POSTGRES_USER kebap
ENV POSTGRES_PASSWORD 1234
ENV POSTGRES_DATABASE kebapdb

COPY ./db_script.sql /docker-entrypoint-initdb.d/