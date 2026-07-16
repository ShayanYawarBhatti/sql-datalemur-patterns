-- Title: Active User Retention
-- Company: Facebook
-- Difficulty: Hard
-- Pattern: month-over-month retention
-- Summary: Count July 2022 active users who were also active in June 2022.
-- Notes: Use exact month ranges in EXISTS to avoid matching June from another year.

SELECT
  7 AS mth,
  COUNT(DISTINCT current_month.user_id) AS monthly_active_users
FROM user_actions AS current_month
WHERE current_month.event_date >= DATE '2022-07-01'
  AND current_month.event_date < DATE '2022-08-01'
  AND EXISTS (
    SELECT 1
    FROM user_actions AS previous_month
    WHERE previous_month.user_id = current_month.user_id
      AND previous_month.event_date >= DATE '2022-06-01'
      AND previous_month.event_date < DATE '2022-07-01'
  );
