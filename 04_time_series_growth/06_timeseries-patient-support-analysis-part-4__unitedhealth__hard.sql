-- Title: Patient Support Analysis (Part 4)
-- Company: UnitedHealth
-- Difficulty: Hard
-- Pattern: monthly aggregation + LAG
-- Summary: Calculate month-over-month growth in calls longer than five minutes.
-- Notes: Aggregate by calendar month before applying LAG in chronological order.

WITH monthly_calls AS (
  SELECT
    DATE_TRUNC('month', call_date) AS month_start,
    COUNT(*) AS curr_mth_calls
  FROM callers
  WHERE call_duration_secs > 300
  GROUP BY DATE_TRUNC('month', call_date)
),
call_growth AS (
  SELECT
    month_start,
    curr_mth_calls,
    LAG(curr_mth_calls) OVER (ORDER BY month_start) AS prev_mth_calls
  FROM monthly_calls
)

SELECT
  EXTRACT(YEAR FROM month_start) AS yr,
  EXTRACT(MONTH FROM month_start) AS mth,
  ROUND(
    100.0 * (curr_mth_calls - prev_mth_calls)
    / NULLIF(prev_mth_calls, 0),
    1
  ) AS long_calls_growth_pct
FROM call_growth
ORDER BY month_start;
