SELECT
    t1.date_date,
    t1.orders_id,
    t1.products_id,
    t1.quantity,
    t1.revenue,
    t2.purchse_price,  

    
    CAST(t1.quantity AS INT64) * CAST(t2.purchse_price AS FLOAT64) AS purchase_cost,

    
    t1.revenue - (CAST(t1.quantity AS INT64) * CAST(t2.purchse_price AS FLOAT64)) AS margin

FROM 
    {{ ref('stg_raw__sales') }} AS t1
INNER JOIN 
    {{ ref('stg_raw__product') }} AS t2 
    ON t1.products_id = t2.products_id
