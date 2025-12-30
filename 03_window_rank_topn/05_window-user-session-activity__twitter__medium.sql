-- Title: User Session Activity
-- Company: Twitter
-- Difficulty: Medium
-- Access: Premium
-- Pattern: sessionization (time gaps) / window (LAG)
-- Summary: Break user events into sessions based on inactivity gaps, then compute session-level metrics (counts/durations).
-- Notes: Use LAG to compute time gaps; start a new session when gap exceeds threshold; cumulative SUM to assign session_id.
-- Dialect: PostgreSQL

SELECT 
  user_id,
  session_type,
  DENSE_RANK() OVER(
  PARTITION BY session_type
  ORDER BY SUM(duration) DESC) AS ranking
FROM sessions 
WHERE start_date BETWEEN '2022-01-01' AND '2022-02-01'
GROUP BY user_id, session_type;