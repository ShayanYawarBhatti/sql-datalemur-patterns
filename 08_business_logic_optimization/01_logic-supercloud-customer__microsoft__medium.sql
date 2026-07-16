-- Title: Supercloud Customer
-- Company: Microsoft
-- Difficulty: Medium
-- Pattern: relational division + HAVING
-- Summary: Return customers who cover every available product category.
-- Notes: Compare each customer's distinct category count with the full category count.

SELECT cc.customer_id
FROM customer_contracts AS cc
INNER JOIN products AS p
  ON cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT p.product_category) = (
  SELECT COUNT(DISTINCT product_category)
  FROM products
);
