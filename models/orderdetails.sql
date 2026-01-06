

select 
od.orderId,
od.productId,
od.unitPrice,
od.quantity,
pr.productName,
pr.categoryId,
od.unitPrice * od.quantity as total,
(pr.unitPrice * od.quantity) - total as discount
from {{source('sources','order_details')}} od
left join {{source('sources','products')}} pr
    on od.productId = pr.productId