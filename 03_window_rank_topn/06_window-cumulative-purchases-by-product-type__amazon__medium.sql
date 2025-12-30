-- Title: Cumulative Purchases by Product Type
-- Company: Amazon
-- Difficulty: Medium
-- Access: Premium
-- Pattern: running total (window SUM)
-- Summary: Compute cumulative purchases over time per product type using a running SUM window.
-- Notes: Aggregate daily (or event-level) first if needed, then SUM(...) OVER (PARTITION BY product_type ORDER BY date).
-- Dialect: PostgreSQL

SELECT 
  order_date, 
  product_type,
  SUM(quantity) OVER(
  PARTITION BY product_type
  ORDER BY order_date ASC) AS cum_purchased
FROM total_trans
ORDER BY order_date ASC;


