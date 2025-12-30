-- Title: Histogram of Users and Purchases
-- Company: Walmart
-- Difficulty: Medium
-- Access: Free
-- Pattern: histogram (2-stage aggregation)
-- Summary: Build a histogram of purchase frequency by counting purchases per user, then counting users per purchase-count bucket.
-- Notes: Stage 1: purchases per user. Stage 2: users per bucket. Order by bucket.
-- Dialect: PostgreSQL

WITH latest_trans_cte AS (
SELECT
  transaction_date,
  user_id,
  product_id,
  RANK() OVER(
    PARTITION BY user_id 
    ORDER BY transaction_date DESC) AS trans_rank 
  FROM user_transactions
)

SELECT 
  transaction_date,
  user_id,
  COUNT(product_id) AS purchase_count
FROM latest_trans_cte
WHERE trans_rank = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date