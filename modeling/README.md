# Modeling

This project focuses on the modeling aspect of dbt. It contains some examples on modeling.

## Setup

1. Run postgres docker container.

   ```shell
   docker-compose -f ../docker-compose.yml up
   ```

1. Copy the content of [profiles.yml](profiles.yml) and append it to `~/.dbt/profiles.yml`.

1. Run the project.

   ```shell
   dbt run
   ```

1. Test the project.

   ```shell
   dbt test
   # This will fail, unless you edit the table_model.sql to remove the null record.
   # Once table_model.sql is changed, run dbt to remove the null record and test it again.
   dbt run
   dbt test  # Should pass now
   ```

1. Once you are done, stop and remove the postgres container.

   ```shell
   docker-compose -f ../docker-compose.yml down
   ```

## Notes

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 