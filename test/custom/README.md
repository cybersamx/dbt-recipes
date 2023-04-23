# Custom Test

An example of testing with a custom generic test function. 

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

## Notes

* We can declare our custom generic test in either subdirectory within the project directory.
  * `tests/generic`
  * `macros`

## References

* [dbt Docs: Tests](https://docs.getdbt.com/docs/build/tests)
* [dbt Docs: Writing Custom Generic Tests](https://docs.getdbt.com/guides/best-practices/writing-custom-generic-tests)