# For

This example creates a table called `for_table` with a column called `n` and uses the jinja `for` keyword to seed 15 rows.

| n |
|--:|
| 0 |
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
| 6 |

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

In SQL, we can do it this albeit without a loop construct.

```sql
with source_data as (
  select 0 as n
  union all
  select 1 as n
  union all
  select 2 as n
  -- ...
)

select * from source_data
```
