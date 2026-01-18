
select * from {{ref("joins")}}
where categoryName = '{{var('category')}}'