select * from {{ref('joins')}}
where date_part('year', orderDate) = 2021