

select count('*') as count, companyName, contactName
-- from {{ref("customers")}}
from {{source("sources","customers")}}
group by companyName, contactName
having count > 1