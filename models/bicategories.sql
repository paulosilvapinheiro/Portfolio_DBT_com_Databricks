
select {{retorna_campos()}} from {{ref("joins")}}
where categoryName = '{{var('category')}}'