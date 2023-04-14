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

1. Run the project.

   ```shell
   dbt run
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## References

* [dbt Docs: About dbt sources](https://docs.getdbt.com/docs/build/sources)