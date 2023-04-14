# dbt Recipes

Started this project as I was learning dbt. Hope to build up a handy reference for anyone looking up for an example on doing things in dbt.

* Modeling
  * [Basic dbt SQL modeling](modeling/sql)
  * [Basic dbt Python modeling](modeling/python)
* Source
  * [Basic dbt source example](source/basic)

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

All the dbt projects in this repo uses one common instance of postgres as defined by this [docker-compose.yml](docker-compose.yml) file.

1. Run the postgres container. Make sure we are in the root directory where [docker-compose.yml](docker-compose.yml) is.

   ```shell
   docker-compose up
   ```

1. Copy the content of [profiles.yml](modeling/sql/profiles.yml) and append it to `~/.dbt/profiles.yml` so that any dbt projects in this repo can connect to the postgres instance.

   ```shell
   DBT_PROFILES_FILE="${HOME}/.dbt/profiles.yml"
   [ -f "${DBT_PROFILES_FILE}" ] || touch "${DBT_PROFILES_FILE}"
   cat ./profiles.yml >> "${DBT_PROFILES_FILE}"
   unset DBT_PROFILES_FILE  
   ```
   
1. Once you are done, stop and remove the postgres container.

   ```shell
   docker-compose down
   ```

### Querying and Troubleshooting

Once the postgres container is running, we can query postgres by running the following command from a different shell.

```shell
# `exec -it` = execute a command in a docker container
# `postgres_dbt_recipes` = the container name 
# `-U` = the user to log into postgres
docker exec -it postgres_dbt_recipes psql -U postgres
```