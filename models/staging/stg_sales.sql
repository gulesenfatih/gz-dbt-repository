WITH sales AS (
    SELECT * FROM {{ source('raw', 'sales') }}
),

renamed AS (
    SELECT
        date_date,
        pdt_id AS products_id, -- İşte o meşhur isim değişikliği burada!
        orders_id,
        revenue,
        quantity
    FROM sales
)

SELECT * FROM renamed