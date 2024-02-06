select distinct(p.product_name), f.product_code, f.base_price, f.promo_type
from dim_products as p
inner join fact_events as f
on  p.product_code = f.product_code
where base_price > 500 and promo_type = "BOGOF"
order by product_name asc;
