# dbt Recipes

Started this project as I was learning dbt. Hope to build up a handy reference for anyone looking up for an example on doing things in dbt.

* [dbt Modeling](modeling)

## Setup

### Installing dbt

To install dbt:

```shell
# This will install dbt-postgres plugin and dbt-core
$ dbt install dbt-postgres
$ dbt --version
Core:
  - installed: 1.4.5
  - latest:    1.4.5 - Up to date!

Plugins:
  - postgres:  1.4.5 - Up to date!
```

To upgrade:

```shell
dbt install --upgrade dbt-core
```

### Running Postgres

All the dbt projects in this repo uses one common instance of postgres that can be started from this [docker-compose.yml](docker-compose.yml) file.

```shell
docker-compose up
```

### Querying and Troubleshooting

Once the postgres container is running, we can query postgres by running the following command from a different shell.

```shell
# `exec -it` = execute a command in a docker container
# `postgres_dbt_recipes` = the container name 
# `-U` = the user to log into postgres
docker exec -it postgres_dbt_recipes psql -U postgres
```