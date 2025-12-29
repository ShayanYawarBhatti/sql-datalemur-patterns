-- Title: Tweets' Rolling Averages
-- Company: Twitter
-- Difficulty: Medium
-- Access: Free
-- Pattern: window
-- Summary: Compute rolling averages over time per user using a window frame.
-- Notes: Order by date; ensure frame boundaries match the definition.
-- Dialect: PostgreSQL

SELECT 
  user_id, 
  tweet_date, 
  ROUND(AVG(tweet_count) OVER(
  PARTITION BY user_id 
  ORDER BY tweet_date
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_avg_3day
FROM tweets