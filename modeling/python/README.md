# Basic Python Modeling

Since version 1.3, dbt officially supports python with the following constraints:

* Python runs remotely on the target data warehouse.
* As of this writing, the data warehouses that officially supports python in dbt are: Snowflake, BigQuery, and Databricks. If you are using say Redshift, you are out of luck.

However, we can use a third-party library call [dbt-fal](https://github.com/fal-ai/fal/tree/main/projects/adapter) to run python locally with other dbt database or data warehouse connectors.

This project focuses on building the same dbt model in [the sql model project](../basic) but with python and the `dbt-fal` library.

## Setup

1. Install the dependencies needed to run the python model.

   ```shell
   pip install dbt-fal pyarrow
   ```

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Build the project.

   ```shell
   dbt build
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## References

* [dbt Docs: About dbt models](https://docs.getdbt.com/docs/build/models)
* [dbt Docs: Python models](https://docs.getdbt.com/docs/build/python-models)
* [Pandas DataFrame reference](https://pandas.pydata.org/docs/reference/frame.html)