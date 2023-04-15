# Basic Seeding

This project focuses on the basics of building dbt models using SQL.

Alternatively, we can also build dbt models using Python, which will be covered in a different project.

## dbt SQL Models

A dbt SQL model is defined in a `.sql` file that encapsulates a select statement that describes a model.

![Model files](images/model_files.png)

* The `companies` table has been created when launching postgres via docker.
* The `people` table is created when running `dbt run`. See the annotated diagram.
* The `employees` view is created when running `dbt run`.

## Setup

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Query the companies table. We see that the table companies has data that were inserted by the sql script `db-init.sql`.

   ```shell
   $ docker exec -it postgres_dbt_recipes psql -U postgres
   postgres=# \c deb_dev
   You are now connected to database "db_dev" as user "postgres".
   db_dev=# SELECT * FROM dbt_recipes.companies;
    id | country |       name       
   ----+---------+------------------
     1 | us      | Acme Inc
     2 | us      | Fey LLC
     3 | uk      | Snatch Ltd
     4 | cn      | Ming Enterprises
   (4 rows)
   ```

1. Run the project.

   ```shell
   dbt seed
   ```

1. Query the companies table.

   ```shell
   $ docker exec -it postgres_dbt_recipes psql -U postgres
   postgres=# \c db_dev
   You are now connected to database "db_dev" as user "postgres".
   db_dev=# SELECT * FROM dbt_recipes.companies;
    id | country |       name        
   ----+---------+-------------------
     5 | mx      | Sanchez Tooling
     6 | de      | Mueller GmbH
     7 | us      | Kingston Software
   (3 rows)
   ```

   As you can see, running seeds replace the previous content of the table with the content in the seed csv files.

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## Notes

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 

## References

* [dbt Docs: dbt Seeds](https://docs.getdbt.com/docs/build/seeds)
