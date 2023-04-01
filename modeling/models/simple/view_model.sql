select * from {{ ref('table_model') }}
    where id = 1
