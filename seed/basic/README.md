# Basic Seeding

This project focuses on the basics of building dbt models using SQL.

Alternatively, we can also build dbt models using Python, which will be covered in a different project.

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

1. Seed the project.

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

## Notes/Tips

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 
* We can use the `ref` jinga function to reference a seed, eg. we can reference the companies seed when defining a model by calling the following:
  ```sql
  select * from {{ ref('companies') }}
  ```
* Use seeds for static data:
  * A list of look-up data, eg. telephone area code to states.
  * A list of well-known data, eg. a list of admin account ids.
* Don't use seeds to load raw data from csv to the destination data warehouse.
* Use `--select` flag to select a seed to load at a given time, eg. `dbt seed --select companies`.
* Sometimes it's useful to define the datatype of the columns of your seed. For example, for `zip_codes.csv`, if we don't explicitly declare the `zip_code` as a text datatype, the leading zeros will not be preserved as numerical values in csv will implicitly be converted to a numeric datatype.
  * Let's suppose we change the datatype of a column, running `dbt seed` will do nothing update the table with new datatype. Instead, run `dbt seed --full-refresh` to drop the existing "seed" tables and recreate/reload the new tables.  


## References

* [dbt Docs: dbt Seeds](https://docs.getdbt.com/docs/build/seeds)
* [dbt Docs: dbt Seed Properties](https://docs.getdbt.com/reference/seed-properties)
