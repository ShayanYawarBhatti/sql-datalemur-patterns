-- Title: Fill Missing Client Data
-- Company: Accenture
-- Difficulty: Medium
-- Access: Premium
-- Pattern: imputation / forward-fill
-- Summary: Fill missing client attributes using known values from other rows (e.g., carry forward most recent non-null value per client).
-- Notes: Common approaches: window MAX(...) FILTER (WHERE ...) over partitions, or LAST_VALUE(...) IGNORE NULLS (dialect-dependent).
-- Dialect: PostgreSQL

WITH filled_category AS (SELECT
  product_id,
  category,
  name,
  COUNT(category) OVER(
  ORDER BY product_id) AS numbered_category
FROM products)

SELECT
  product_id,
  COALESCE(
    category,
    MAX(category) OVER( 
    PARTITION BY numbered_category)
  ) AS category,
  name
FROM filled_category 

/*
How does coalesce work? Replacing values is the most common application
SELECT COALESCE(middle_name, 'N/A') AS middle_name
FROM users;
If middle_name is NULL → return 'N/A'.

We do max category, because this is what's supposed to be filled not 
numbered_category, the max(category) will give us the non null value in 
the category column, and then fill that value in all nulls.
*/
