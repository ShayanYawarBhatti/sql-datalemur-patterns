-- Title: User Session Activity
-- Company: Twitter
-- Difficulty: Medium
-- Pattern: grouped ranking
-- Summary: Rank users by total session duration within each session type.
-- Notes: Aggregate duration per user and type, then rank totals within each type.

SELECT
  user_id,
  session_type,
  DENSE_RANK() OVER (
    PARTITION BY session_type
    ORDER BY SUM(duration) DESC
  ) AS ranking
FROM sessions
WHERE start_date >= DATE '2022-01-01'
  AND start_date < DATE '2022-02-01'
GROUP BY user_id, session_type;
