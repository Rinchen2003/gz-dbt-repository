select
    
    t1.* except (quantity),
    t2.purchase_price,

    t1.quantity,
    t1.revenue,

    cast(t1.quantity as int64) * t2.purchase_price as purchase_cost,

    
    t1.revenue - (cast(t1.quantity as int64) * t2.purchase_price) as margin,

from
    {{ ref("stg_raw__sales.sql") }} as t1  
    
inner join {{ ref("stg_raw__product.sql") }} as t2 on t1.products_id = t2.products_id
