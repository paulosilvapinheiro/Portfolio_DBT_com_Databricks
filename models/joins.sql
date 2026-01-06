
with prod as (
    select 
        ct.categoryName,
        sp.companyName as suppliers,
        pd.productName,
        pd.unitPrice,
        pd.productId
    from {{source("sources","products")}} pd
    left join {{source("sources","suppliers")}} sp on pd.supplierId = sp.supplierId
    left join {{source("sources","categories")}} ct on pd.categoryId = ct.categoryId
), orddetail as (

    select
        pd.*,
        od.orderId,
        od.quantity,
        od.discount
    from {{ref("orderdetails")}} od
    left join prod pd on od.productId = pd.productId
),ordrs as (

    select
        ord.orderDate,
        ord.orderId,
        cs.companyName as customer,
        em.name as employee,
        em.age,
        em.lengthofservice
    from {{source('sources','orders')}} ord
    left join {{ref('customers')}} cs on ord.customerId = cs.customerId
    left join {{ref('employees')}} em on ord.employeeId = em.employeeId
    left join {{source('sources','shippers')}} sh on ord.shipVia = sh.shipperId
), finalJoin as (

    select
        od.*,
        ord.orderDate,
        ord.customer,
        ord.employee,
        ord.age,
        ord.lengthofservice
    from orddetail od
    left join ordrs ord on od.orderId = ord.orderId
)
select * from finalJoin