# Basic

This project focuses on the basics of building dbt models using SQL.

Alternatively, we can also build dbt models using Python, which will be covered in a different project.

## dbt SQL Models

A dbt SQL model is defined in a `.sql` file that encapsulates a select statement that describes a model.

![Model files](images/model_files.png)

## Setup

1. Run the project.

   ```shell
   dbt run
   ```

1. Test the project.

   ```shell
   dbt test
   # This will fail, unless we remove the record with a null id. Edit people.sql and run the following.
   dbt run
   dbt test  # Should pass now
   ```

## Notes

* If we change the model name in the files, the new corresponding tables and views bearing the new names will be created. But the old tables won't be dropped. 

## References

* [dbt Docs: About dbt models](https://docs.getdbt.com/docs/build/models)
* [dbt Docs: SQL models](https://docs.getdbt.com/docs/build/sql-models)
* [dbt Docs: Model properties](https://docs.getdbt.com/reference/model-properties)