-- Title: Histogram of Users and Purchases
-- Company: Walmart
-- Difficulty: Medium
-- Pattern: window ranking + aggregation
-- Summary: Find each user's latest transaction date and count purchases made on that date.
-- Notes: Rank dates per user, keep the latest rows, then aggregate same-date purchases.

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
