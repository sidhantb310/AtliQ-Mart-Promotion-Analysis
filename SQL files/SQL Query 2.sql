select distinct (city), count(store_id)
from dim_stores
group by city 
order by count(store_id) desc;