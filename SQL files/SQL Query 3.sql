SELECT campaign_name,
SUM(quantity_sold_before_promo * base_price) AS total_revenue_before_promotion,
SUM(quantity_sold_after_promo * base_price) AS total_revenue_after_promotion
FROM dim_campaigns AS c
INNER JOIN fact_events AS f 
ON c.campaign_id = f.campaign_id
GROUP BY campaign_name
ORDER BY campaign_name ASC;