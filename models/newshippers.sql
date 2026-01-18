select t1.companyName, t2.shipper_email from
{{source("sources","shippers")}} t1
left join {{ref('shipper_email')}} t2
    on t1.shipperId = t2.shipper_Id