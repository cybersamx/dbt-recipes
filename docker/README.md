# Dockerize dbt

Container is a great way of packaging a dbt project and dbt executable (plus its dependencies) so that we can use it in a data pipeline or in a local development environment.

In this project, we copy the dbt project into the Docker image and install dependencies `dbt-core` and `dbt-postgres`. We added `docker-compose.yml` as a convenience for running the dbt container alongside with postgres container to test that it works.

This example also demonstrates how we can dynamically inject secrets at runtime via environment variables. First by injecting it via docker-compose runtime before passing the environment variable in the docker container and finally landing in the dbt `profiles.yml` via the jinja function `env_var`. 

## Setup

1. Build the dbt project as a docker image.

   ```shell
   docker-compose build
   ```

1. Launch the postgres and dbt containers.

   ```shell
   echo 'PG_PASSWORD=password' > .env
   docker-compose up  # docker
   # Alternatively...
   PG_PASSWORD=password docker-compose up
   ```

1. This project is a clone of the [source](../source/basic) project. So tunning the containers will create a view called `customer_orders`. To verify, do this:

   ```shell
   docker exec -it dbt-recipes-postgres psql -U postgres -d db_dev
   db_dev=# select * from dbt_recipes.customer_orders;
    id | qty |         ordered_at         | customer_id | customer_name |      address      |  zip  |       email        | product_id |   product_name   | product_price 
   ----+-----+----------------------------+-------------+---------------+-------------------+-------+--------------------+------------+------------------+---------------
     1 |   1 | 2022-12-20 00:45:13        |           1 | Martin Dole   | 458 Joy Valley Rd | 40506 | martin@example.com |          2 | Air Jordan shoe  |        234.92
     1 |   2 | 2022-12-20 00:45:13        |           1 | Martin Dole   | 458 Joy Valley Rd | 40506 | martin@example.com |          3 | Northface jacket |        150.00
     2 |   1 | 2023-04-20 05:45:19.129675 |           2 | Sanjay Patel  | 101 Main St       | 02138 | spatel@example.com |          3 | Northface jacket |        150.00
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```


## Notes

* To troubleshoot a dbt container, edit the last line of [Dockerfile](Dockerfile) and add `&& sleep infinity`.

  ```dockerfile
  CMD dbt deps && dbt build && sleep infinity
  ``` 
 
  This allows us to run a shell in the container via `docker exec`.

  ```shell
  docker exec -it postgres /bin/bash
  ```

## References

* [Dokcer Docs: Compose File v3 Reference](https://docs.docker.com/compose/compose-file/compose-file-v3)
* [Containerized Jaffle Shop](https://github.com/gmyrianthous/jaffle_shop)