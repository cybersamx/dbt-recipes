# dbt Package: dbt_utils

An example of installing and using a third-party dbt package called [dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/).

This project is based (with modification) on dbt Labs sample project [jaffle_shop](https://github.com/dbt-labs/jaffle_shop). Some `dbt_utils` functions are added to the model definition files.

## Setup

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Seed the data, install the package and run the project.

   ```shell
   dbt deps
   dbt build
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## References

* [dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils)