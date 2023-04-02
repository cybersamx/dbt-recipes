select * from {{ ref('people') }}
    where id = 1
