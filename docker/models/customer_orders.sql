select
    o.id,
    o.qty,
    o.ordered_at,
    o.customer_id,
    c.name as customer_name,
    c.address,
    c.zip,
    c.email,
    o.product_id,
    p.name as product_name,
    p.price as product_price
from {{ source('dbt_recipes', 'orders') }} o
left join {{ source('dbt_recipes', 'customers') }} c
    on o.customer_id = c.id
left join {{ source('dbt_recipes', 'products') }} p
    on o.product_id = p.id