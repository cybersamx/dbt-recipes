# dbt Recipes

Started this project as I was learning dbt. Hope to build up a handy reference for anyone looking up for an example on doing things in dbt.

* Modeling
  * [dbt SQL modeling](modeling/sql)
    * [Basic SQL modeling](modeling/sql/basic)
    * [SQL conditional](modeling/sql/conditional)
    * [Jinja for](modeling/sql/for)
  * [dbt basic Python modeling](modeling/python)
* Source
  * [dbt basic source (with source freshness) example](source/basic)
* Seed
  * [dbt basic seed example](seed/basic)
* Docker
  * [Dockerize dbt](docker)
* Macros
  * [Installing third-party dbt packages: dbt_utils](macros/dbt_utils)
* Test
  * [dbt singular test](test/singular)
  * [dbt standard generic tests](test/generic)
  * [dbt custom generic tests](test/custom)

## Setup

### Create a virtual environment

1. Create virtual environment.

   ```shell
   $ python3 -m venv .venv
   $ source .venv/bin/activate
   (.venv) $
   ```

### Installing dbt

1. Install pip and tools.

   ```shell
   pip install -r requirements-pip.txt
   pip install -r requirements-tools.txt
   ```

1. Test that dbt is working.
   
   ```shell
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

1. The `docker-compose.yml` uses the `db-init.sql` to create users and tables, and then seed tables with initial set of data.

1. When you don't need postgres anymore, stop and remove the postgres container.

   ```shell
   docker-compose down
   ```

### Tips

A dbt profile describes a set of configurations needed to connect to a database. Every sample project in this repo has a project-scope profiles as `profiles.yml` at the project root.

If you wish to have a global-scoped profiles, you can create a `~/.dbt/profiles.yml` file or set `DBT_PROFILES_FILE` to the right file. Note that if a dbt project has a `profiles.yml` file, it will still override the global `profiles.yml`. Your project configuration references a database connection profile. 

> **Notes**
> 
> It's actually not a bad idea to put all your data connection profiles in a global profiles.yml. This way you avoid accidentally checking in any sensitive configurations being checked into your version control system.  

1. If you want to set the dbt profile globally, copy the content of [profiles.yml](modeling/sql/basic/profiles.yml) and append it to the global dbt profiles file `~/.dbt/profiles.yml`.  

   ```shell
   DBT_PROFILES_FILE="${HOME}/.dbt/profiles.yml"
   [ -f "${DBT_PROFILES_FILE}" ] || touch "${DBT_PROFILES_FILE}"
   cat ./profiles.yml >> "${DBT_PROFILES_FILE}"
   unset DBT_PROFILES_FILE  
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

