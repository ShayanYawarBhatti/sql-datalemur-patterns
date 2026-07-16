-- Title: User's Third Transaction
-- Company: Uber
-- Difficulty: Medium
-- Pattern: ROW_NUMBER + nth row
-- Summary: Return each user's third chronological transaction.
-- Notes: Number transactions per user and filter to row three.

WITH transaction_num AS (
  SELECT
    user_id, 
    spend,
    transaction_date,
    ROW_NUMBER() OVER(
    PARTITION BY user_id 
    ORDER BY transaction_date) AS rank_num
  FROM transactions
)

SELECT
  user_id, 
  spend, 
  transaction_date
FROM transaction_num
WHERE rank_num = 3;
