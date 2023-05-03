select * from {{ ref('people') }}
    where company = 'Acme'
