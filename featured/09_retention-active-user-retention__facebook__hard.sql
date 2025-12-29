-- Title: Active User Retention
-- Company: Facebook
-- Difficulty: Hard
-- Access: Free
-- Pattern: retention (month-over-month)
-- Summary: Count July 2022 monthly active users who were also active in June 2022 (active in both current and previous month).
-- Notes: Reduce to distinct (user_id, month) first, then self-join July to June (July = June + 1 month).
-- Dialect: PostgreSQL

SELECT 
  EXTRACT(MONTH FROM curr_month.event_date) AS mth, 
  COUNT(DISTINCT curr_month.user_id) AS monthly_active_users 
FROM user_actions AS curr_month
WHERE EXISTS (
  SELECT last_month.user_id 
  FROM user_actions AS last_month
  WHERE last_month.user_id = curr_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) =
    EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)
  AND EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);