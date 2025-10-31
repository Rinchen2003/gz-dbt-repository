SELECT

    o.orders_id,
    o.date_date,
    o.revenue,
    o.margin,
    
    
    s.shipping_fee,
    s.log_cost,
    s.ship_cost,
    
    
    ROUND(
        +SAFE_CAST(o.margin As FLOAT64)
        + SAFE_CAST(s.shipping_fee AS FLOAT64) 
        - SAFE_CAST(s.log_cost AS FLOAT64) 
        - SAFE_CAST(s.ship_cost AS FLOAT64), 
    2) AS operational_margin
    
FROM
    {{ ref('int_orders_margin') }} AS o  
LEFT JOIN
    {{ ref('stg_raw__ship') }} AS s      
    USING(orders_id) 
ORDER BY 
    orders_id DESC
















