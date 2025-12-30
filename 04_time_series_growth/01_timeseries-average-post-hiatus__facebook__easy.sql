-- Title: Average Post Hiatus (Part 1)
-- Company: Facebook
-- Difficulty: Easy
-- Access: Free
-- Pattern: time series + window (LAG)
-- Summary: Compute the average gap in days between consecutive posts per user using LAG, then average the gaps.
-- Notes: LAG(post_date) gives prior post; date difference yields hiatus; exclude first post per user (NULL gap).
-- Dialect: PostgreSQL

SELECT 
  user_id, 
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE EXTRACT(YEAR from post_date) = '2021'
GROUP BY user_id
HAVING COUNT(post_id) > 1;



