# Basic

This project focuses on the basic dbt modeling.

## Setup

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

## Notes

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 