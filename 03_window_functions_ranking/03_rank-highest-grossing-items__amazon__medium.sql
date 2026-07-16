-- Title: Highest-Grossing Items
-- Company: Amazon
-- Difficulty: Medium
-- Pattern: grouped top N
-- Summary: Return the two highest-spend products per category in 2022.
-- Notes: Aggregate spend first, then apply ROW_NUMBER within each category.

WITH ranked_spending AS (
  SELECT
    category,
    product,
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER (
      PARTITION BY category
      ORDER BY SUM(spend) DESC, product
    ) AS ranking
  FROM product_spend
  WHERE transaction_date >= DATE '2022-01-01'
    AND transaction_date < DATE '2023-01-01'
  GROUP BY category, product
)

SELECT
  category,
  product,
  total_spend
FROM ranked_spending
WHERE ranking <= 2
ORDER BY category, ranking;
