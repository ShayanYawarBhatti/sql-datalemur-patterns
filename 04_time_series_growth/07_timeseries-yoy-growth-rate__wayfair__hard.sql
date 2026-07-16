-- Title: Y-on-Y Growth Rate
-- Company: Wayfair
-- Difficulty: Hard
-- Pattern: yearly aggregation + LAG
-- Summary: Calculate annual spend and year-over-year growth by product.
-- Notes: Aggregate to one row per product-year before applying LAG.

WITH yearly_spend AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date)::INT AS year,
    product_id,
    SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
),
spend_with_previous AS (
  SELECT
    year,
    product_id,
    curr_year_spend,
    LAG(curr_year_spend) OVER (
      PARTITION BY product_id
      ORDER BY year
    ) AS prev_year_spend
  FROM yearly_spend
)

SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(
    100.0 * (curr_year_spend - prev_year_spend)
    / NULLIF(prev_year_spend, 0),
    2
  ) AS yoy_rate
FROM spend_with_previous
ORDER BY product_id, year;
