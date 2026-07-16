-- Title: Fill Missing Client Data
-- Company: Accenture
-- Difficulty: Medium
-- Pattern: forward fill with windows
-- Summary: Fill missing categories using the most recent prior non-null category.
-- Notes: A cumulative non-null count defines groups; MAX propagates each group category.

WITH filled_category AS (
  SELECT
    product_id,
    category,
    name,
    COUNT(category) OVER (ORDER BY product_id) AS category_group
  FROM products
)

SELECT
  product_id,
  COALESCE(
    category,
    MAX(category) OVER (PARTITION BY category_group)
  ) AS category,
  name
FROM filled_category;
