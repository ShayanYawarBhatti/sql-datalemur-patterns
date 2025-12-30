-- Title: Sending vs. Opening Snaps
-- Company: Snapchat
-- Difficulty: Medium
-- Access: Free
-- Pattern: aggregation + ratio (optionally window)
-- Summary: Compare sent vs opened snaps by aggregating counts per sender/receiver (or overall) and computing an open rate.
-- Notes: Use conditional aggregation; protect division with NULLIF; round if required.
-- Dialect: PostgreSQL

WITH snap_stats AS (
  SELECT
    age.age_bucket, 
    SUM(CASE WHEN activities.activity_type = 'send' 
    THEN activities.time_spent ELSE 0 END) AS send_time,
    SUM(CASE WHEN activities.activity_type = 'open' 
    THEN activities.time_spent ELSE 0 END) AS open_time,
    SUM(activities.time_spent) AS total_timespent
  FROM activities
  INNER JOIN age_breakdown AS age
    ON activities.user_id = age.user_id
  WHERE activities.activity_type IN ('open', 'send')
  GROUP BY age.age_bucket
)

SELECT 
  age_bucket,
  ROUND(100.0 * send_time/total_timespent, 2) AS send_pct,
  ROUND(100.0 * open_time/total_timespent, 2) AS open_pct
FROM snap_stats

