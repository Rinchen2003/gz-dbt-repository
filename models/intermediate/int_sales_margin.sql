select

    t1.quantity,

    t2.purchse_price,

    t1.revenue,

    cast(t1.quantity as int64) * t2.purchase_price as purchase_cost,

    t1.revenue - (cast(t1.quantity as int64) * t2.purchase_price) as margin,

from {{ ref("stg_raw__sales") }} as t1

inner join {{ ref("stg_raw__product") }} as t2 on t1.products_id = t2.products_id
