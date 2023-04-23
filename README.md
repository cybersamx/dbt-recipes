# dbt Recipes

Started this project as I was learning dbt. Hope to build up a handy reference for anyone looking up for an example on doing things in dbt.

* Modeling
  * [Basic dbt SQL modeling](modeling/sql)
  * [Basic dbt Python modeling](modeling/python)
* Source
  * [Basic dbt source (with source freshness) example](source/basic)
* Seed
  * [Basic dbt seed example](seed/basic)
* Docker
  * [Dockerize dbt](docker)
* Macros
  * [dbt_utils](macros/dbt_utils)
* Test
  * [Basic dbt generic tests](test/basic)
  * [Custom dbt generic tests](test/custom)

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

1. If you want to set the profile globally, copy the content of [profiles.yml](modeling/sql/profiles.yml) and append it to the global dbt profiles file `~/.dbt/profiles.yml`. This is step is purely informative as it's a moot practice to do so since every dbt project has its own `profiles.yml` with the same profiles that will override the global profiles.  

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

* Once the postgres container is running, we can query postgres by running the following command from a different shell.

   ```shell
   # `exec -it` = execute a command in a docker container
   # `postgres_dbt_recipes` = the container name 
   # `-U` = the user to log into postgres
   docker exec -it postgres_dbt_recipes psql -U postgres
   ```

* Use the `-d` or `--debug` flag in the `dbt` command to display debug logs during its execution. For example: `dbt -d build`. Running the subcommand `debug` prints out basic info of dbt like where it reads its configurations, connector used, the connection to the database, etc.

## References

* [dbt Docs: Introduction](https://docs.getdbt.com/docs/introduction)

