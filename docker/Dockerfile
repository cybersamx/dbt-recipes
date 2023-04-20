FROM python:3.10-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends

WORKDIR /app/dbt

RUN pip install --upgrade pip
RUN pip install dbt-postgres==1.4.5

COPY . ./

# `dbt deps` to install packages
# `dbt buld` to build
CMD dbt deps && dbt build