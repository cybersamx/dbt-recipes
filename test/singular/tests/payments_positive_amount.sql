select 1 from {{ ref('raw_payments') }}
where not(amount >= 0)