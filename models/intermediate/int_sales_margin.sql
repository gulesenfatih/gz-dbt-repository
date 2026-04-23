with sales as (
    select * from {{ ref('stg_raw__sales') }}
),

product as (
    select * from {{ ref('stg_raw__product') }}
)

select
    s.orders_id,
    s.date_date,
    s.products_id, -- Burayı pdt_id'den products_id'ye çevirdik
    s.revenue,
    s.quantity,
    CAST(p.purchase_price AS FLOAT64) as purchase_price,
    ROUND(s.quantity * CAST(p.purchase_price AS FLOAT64), 2) as purchase_cost,
    ROUND(s.revenue - (s.quantity * CAST(p.purchase_price AS FLOAT64)), 2) as margin
from sales s
left join product p 
    on s.products_id = p.products_id -- Join yaparken de yeni ismi kullandık