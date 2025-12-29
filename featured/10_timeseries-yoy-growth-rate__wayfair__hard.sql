-- Title: Y-on-Y Growth Rate
-- Company: Wayfair
-- Difficulty: Hard
-- Access: Free
-- Pattern: time series + LAG (YoY)
-- Summary: Compute total yearly spend per product, then compare each year to the previous year to get YoY % growth.
-- Notes: Aggregate to (year, product) first, then LAG(prev_year_spend) within each product. Use NULLIF to avoid divide-by-zero.
-- Dialect: PostgreSQL

WITH yearly_spend_cte AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER (
      PARTITION BY product_id 
      ORDER BY 
        product_id, 
        EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend 
  FROM user_transactions
)

SELECT 
  year,
  product_id, 
  curr_year_spend, 
  prev_year_spend, 
  ROUND(100 * 
    (curr_year_spend - prev_year_spend)
    / prev_year_spend
  , 2) AS yoy_rate 
FROM yearly_spend_cte;