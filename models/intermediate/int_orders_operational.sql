with orders_margin as (
    select * from {{ ref('int_orders_margin') }}
),

ship as (
    select * from {{ ref('stg_raw__ship') }}
)

select
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.log_cost,
    CAST(s.ship_cost AS FLOAT64) as ship_cost,
    -- Operasyonel Marj = Marj + Nakliye Ücreti - Lojistik Maliyeti - Nakliye Maliyeti
    round(o.margin + s.shipping_fee - s.log_cost - CAST(s.ship_cost AS FLOAT64), 2) as operational_margin
from orders_margin o
left join ship s 
    on o.orders_id = s.orders_id