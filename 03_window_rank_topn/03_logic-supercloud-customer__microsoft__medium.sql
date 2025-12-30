-- Title: Supercloud Customer
-- Company: Microsoft
-- Difficulty: Medium
-- Access: Free
-- Pattern: multi-step aggregation (set coverage)
-- Summary: Identify customers who have purchased at least one product from every required product category.
-- Notes: Aggregate distinct categories per customer, then filter where count matches total categories (or use NOT EXISTS).
-- Dialect: PostgreSQL

WITH supercloud_cust AS (
  SELECT 
    cc.customer_id,
    COUNT(DISTINCT p.product_category) AS p_count
  FROM customer_contracts as cc
  INNER JOIN products as p
    ON cc.product_id = p.product_id
  GROUP BY cc.customer_id
)

SELECT customer_id
FROM supercloud_cust
WHERE p_count = (
  SELECT 
    COUNT(DISTINCT product_category) 
  FROM products
);