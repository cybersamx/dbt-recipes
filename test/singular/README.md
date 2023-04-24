# Singular Test

An example of a singular test in dbt.

Singular test is simply the "writing the exact SQL that will return failing records," [dbt reference doc on singular tests](https://docs.getdbt.com/docs/build/tests#singular-tests).

Singular tests are specific to a model or context, often hardcoded. So it's easy to write. In fact, "you may find yourself writing the same basic structure over and over, only changing the name of a column or model. By that point the isn't so singular," [dbt reference doc on singular tests](https://docs.getdbt.com/docs/build/tests#singular-tests).  In that case, it's time to write a [custom generic test](../custom).

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

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## References

* [dbt Docs: Tests](https://docs.getdbt.com/docs/build/tests)