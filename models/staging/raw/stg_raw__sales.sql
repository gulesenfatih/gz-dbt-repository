with 

source as (
    -- Ham veriyi 'raw' kaynağından çekiyoruz
    select * from {{ source('raw', 'sales') }}
),

renamed as (
    -- İşte talimatın istediği temizlik ve isimlendirme alanı:
    select
        date_date,
        orders_id,
        pdt_id as products_id,  -- Burayı 'as products_id' diyerek değiştirdik
        revenue,
        quantity

    from source
)

select * from renamed