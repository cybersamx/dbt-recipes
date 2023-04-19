# Source

A source is a construct in dbt that references a dataset ie. a table or a view, in a data connection.

Once a source is declared, we can do the following:

* Use the [{{ source() }} jinga function](https://docs.getdbt.com/reference/dbt-jinja-functions/source) or `dbt.source('source_name', 'table_name')` python function to define a dbt model.
* Test the source data sets.
* Determine the "freshness" of the source data sets.

## Setup

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Build the project.

   ```shell
   dbt build
   ```

1. Run source freshness to check how "fresh" (up-to-date as defined by your freshness settings). Run this within the minute of the database has completed its start, you will see that the tables are "fresh."

   ```shell
   dbt source freshness
   ...
   04:46:03  1 of 1 START freshness of dbt_recipes.orders ................................... [RUN]
   04:46:03  1 of 1 PASS freshness of dbt_recipes.orders .................................... [PASS in 0.04s]
   ```

1. Now wait more than a minute to make the data stale and rerun the `dbt source freshness`, you will see that we get `ERROR STALE`.

   ```shell
   dbt source freshness
   ...
   04:46:03  1 of 1 START freshness of dbt_recipes.orders ................................... [RUN]
   04:47:26  1 of 1 ERROR STALE freshness of dbt_recipes.orders ............................. [ERROR STALE in 0.04s]
   ```

1. To correct this, let's insert a new row to the `orders` table.

   ```shell
   $ docker exec -it postgres_dbt_recipes psql -U postgres -d db_dev
   db_dev=# INSERT INTO dbt_recipes.orders (id, customer_id, product_id, qty, ordered_at) VALUES (3, 3, 2, 1, CURRENT_TIMESTAMP);
   db_dev=# \q
   $ dbt source freshness  # It will pass this time. 
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## Notes

* For source snapshot freshness to work, we must declare both the `loaded_at_field` attribute (under the table block) and the `freshness` block (under the sources block).
  * The column in the SQL table defined by the `loaded_at_field` must be of datatype timestamp.  

## References

* [dbt Docs: About dbt sources](https://docs.getdbt.com/docs/build/sources)
* [dbt Docs: Source properties](https://docs.getdbt.com/reference/source-properties)