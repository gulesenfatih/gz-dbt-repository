with source as (
    -- Ham veriyi 'raw' kaynağından çekiyoruz
    select * from {{ source('raw', 'product') }}
),

renamed as (
    select
        
        products_id,

        -- 2. Sütun: purchse_price -> purchase_price (İsim düzeltme ve FLOAT64 yapma)
        cast(purchse_price as float64) as purchase_price

    from source
)

select * from renamed