-- Override the default view materialization with table. A table model will be created.
{{ config(materialized='table') }}

-- This creates a table with 2 records: a record with id=1 and a record with id=null
with source_data as (
    select 1 as id
    union all
    select null as id
)

select * from source_data

--  Uncomment the following so that we remove null records allowing dbt test to pass.
--where id is not null
