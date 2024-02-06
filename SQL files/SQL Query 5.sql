Select p.product_name, p.category,
Round((((SUM(quantity_sold_after_promo * base_price) - SUM(quantity_sold_before_promo * base_price)) / SUM(quantity_sold_before_promo * base_price))*100), 2) As IR_PERCENTAGE
from dim_products as p
Inner Join fact_events as f
on p.product_code = f.product_code
Group By p.product_name, p.category
Order By IR_PERCENTAGE desc
Limit 5;