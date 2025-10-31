SELECT
    
    o.orders_id,
    o.date_date,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    
    
    s.shipping_fee,
    s.log_cost,
    s.ship_cost,
    
    
    
    ROUND(
        o.margin + CAST(s.shipping_fee AS FLOAT64) - (CAST(s.log_cost AS FLOAT64) + CAST(s.ship_cost AS FLOAT64)), 
    2) AS operational_margin
    
FROM
    {{ ref('int_orders_margin') }} AS o  
LEFT JOIN
    {{ ref('stg_raw__ship') }} AS s      
    USING(orders_id)                     
    
ORDER BY 
    orders_id DESC
















