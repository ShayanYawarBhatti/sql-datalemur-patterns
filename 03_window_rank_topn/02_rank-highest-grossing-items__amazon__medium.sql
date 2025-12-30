-- Title: Highest-Grossing Items
-- Company: Amazon
-- Difficulty: Medium
-- Access: Free
-- Pattern: top-N ranking (DENSE_RANK/ROW_NUMBER)
-- Summary: Compute total gross per product/category and return the top performers per group using a window rank.
-- Notes: Aggregate revenue first, then rank within each category; filter to top K as required (often top 2).
-- Dialect: PostgreSQL


WITH ranked_spending_cte AS (
SELECT
  category, 
  product, 
  SUM(spend) AS total_spend,
  ROW_NUMBER() OVER (
  PARTITION BY category
  ORDER BY SUM(spend) DESC) AS ranking
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
GROUP BY category, product
)

SELECT 
  category, 
  product,
  total_spend
FROM ranked_spending_cte
WHERE ranking IN (1, 2)
ORDER BY category, ranking;