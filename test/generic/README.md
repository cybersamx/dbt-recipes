# Standard Generic Test

An example of the generic tests provided by dbt-core. 

## Setup

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Seed the data, install the package and run the project.

   ```shell
   dbt seed
   dbt test
   # Or run the following command to seed and test
   dbt build
   ```
   
   > **Note**
   >
   > If you see warnings, chances are that you haven't run `dbt seed`. 

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## References

* [dbt Docs: Tests](https://docs.getdbt.com/docs/build/tests)
