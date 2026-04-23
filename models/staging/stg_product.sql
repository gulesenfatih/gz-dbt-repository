WITH product AS (
    SELECT * FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        products_id,
        CAST(purchse_price AS FLOAT64) AS purchase_price -- Hem tipini düzelttik hem adını
    FROM product
)

SELECT * FROM renamed