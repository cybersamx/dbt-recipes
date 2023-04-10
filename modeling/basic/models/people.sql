-- Override the default materialization (which is view) with table. A table will be
-- created for this model.
{{ config(materialized='table') }}

-- If we only uncomment and use the following select statement, we will get 'relation
-- "people" does not exist' error when we run dbt. Because dbt expects the table people
-- to exist. So create a table prior to running dbt.
-- select * from people

-- However we want dbt to create a table for us, we define a literal dataset and then
-- tell dbt to materialize a table to persist the literal dataset.
with source_data as (
    select
        1 as id,
        'George Lam' as name,
        'Acme' as company
    union all
    select
        2 as id,
        'Sanjay Patel' as name,
        null as company
    -- Remove the select block to make test pass.
    union all
    select
        null as id,
        null as name,
        null as company
)

select * from source_data