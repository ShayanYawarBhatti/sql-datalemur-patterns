-- Title: Cities With Completed Trades
-- Company: Robinhood
-- Difficulty: Easy
-- Access: Free
-- Pattern: join + distinct
-- Summary: List cities that have at least one completed trade by joining trades to users and filtering by completed status.
-- Notes: Use DISTINCT to avoid duplicates; filter completed trades (e.g., status = 'Completed').
-- Dialect: PostgreSQL

SELECT 
  users.city AS city,
  COUNT(trades.order_id) AS completed_trades
FROM trades
INNER JOIN users
  ON trades.user_id = users.user_id
WHERE status = 'Completed'
GROUP BY users.city
ORDER BY completed_trades DESC
LIMIT 3;
