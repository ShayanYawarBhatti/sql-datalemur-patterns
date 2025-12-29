-- Title: User's Third Transaction
-- Company: Uber
-- Difficulty: Medium
-- Access: Free
-- Pattern: window function (ROW_NUMBER)
-- Summary: For each user, order transactions chronologically and return the 3rd one.
-- Notes: ROW_NUMBER assigns a sequence per user; filter to rn = 3. Tie-break with transaction_id if needed.
-- Dialect: PostgreSQL

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