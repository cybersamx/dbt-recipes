# Case Conditional

How to implement conditional in SQL.

## Setup

1. Launch the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml up
   ```

1. Seed and build the project.

   ```shell
   dbt seed
   dbt build
   ```

1. Tear down the postgres container.

   ```shell
   docker-compose -f ../../docker-compose.yml down
   ```

## Notes

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 

## References

* [dbt Docs: SQL case when](https://docs.getdbt.com/sql-reference/case)
* [dbt Docs: dbt jinga functions](https://docs.getdbt.com/reference/dbt-jinja-functions)