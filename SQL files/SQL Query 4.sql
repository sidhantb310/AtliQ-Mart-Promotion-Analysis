Select p.category, 
Round((((Sum(quantity_sold_after_promo) - Sum(quantity_sold_before_promo)) / Sum(quantity_sold_before_promo)) * 100), 2) as ISU_PERCENTAGE,
Rank() Over (Order by (((Sum(quantity_sold_after_promo) - Sum(quantity_sold_before_promo)) / Sum(quantity_sold_before_promo)) * 100) desc) as Rank_order
From dim_products as p
Inner Join fact_events as f
on p.product_code = f.product_code
Where f.campaign_id = "CAMP_DIW_01"
Group By p.category;