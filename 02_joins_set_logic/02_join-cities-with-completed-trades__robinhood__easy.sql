-- Title: Cities With Completed Trades
-- Company: Robinhood
-- Difficulty: Easy
-- Pattern: join + aggregation + top N
-- Summary: Return the three cities with the most completed trades.
-- Notes: Join trades to users, filter completed trades, aggregate by city, and sort descending.

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
