with 

source as (
    select * from {{ source('raw', 'ship') }}
),

renamed as (
    select
        orders_id,
        shipping_fee,
        logCost as log_cost, -- Burayı böyle değiştir: Ham hali logCost, biz log_cost yapmak istiyoruz
        cast(ship_cost as FLOAT64) as ship_cost
    from source
)

select * from renamed