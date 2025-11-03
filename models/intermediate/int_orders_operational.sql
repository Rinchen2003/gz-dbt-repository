SELECT
    
    o.orders_id,
    o.date_date,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    
    
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    
    
    
    ROUND(
        o.margin 
        + SAFE_CAST(s.shipping_fee AS FLOAT64) 
        - SAFE_CAST(s.logcost AS FLOAT64) 
        - SAFE_CAST(s.ship_cost AS FLOAT64), 
    2) AS operational_margin
    
FROM
    
    {{ref('int_orders_margin')}} AS o 
LEFT JOIN
    
    {{ref('stg_raw__ship')}} AS s      
    ON o.orders_id = s.orders_id 
ORDER BY 
    o.orders_id DESC