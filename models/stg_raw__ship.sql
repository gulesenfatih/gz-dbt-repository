with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        log_cost,
        -- ship_cost'u sayısal (FLOAT64) tipe çevirdik
        cast(ship_cost as FLOAT64) as ship_cost

    from source

)

select * from renamed