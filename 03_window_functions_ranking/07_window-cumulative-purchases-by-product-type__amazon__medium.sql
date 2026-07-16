-- Title: Cumulative Purchases by Product Type
-- Company: Amazon
-- Difficulty: Medium
-- Pattern: cumulative window
-- Summary: Calculate running purchased quantity by product type over time.
-- Notes: Partition by product type and order rows by date.

SELECT 
  order_date, 
  product_type,
  SUM(quantity) OVER(
  PARTITION BY product_type
  ORDER BY order_date ASC) AS cum_purchased
FROM total_trans
ORDER BY order_date ASC;
