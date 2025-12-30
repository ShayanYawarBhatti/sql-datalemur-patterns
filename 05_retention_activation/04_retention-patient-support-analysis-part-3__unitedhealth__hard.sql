-- Title: Patient Support Analysis (Part 3)
-- Company: UnitedHealth
-- Difficulty: Hard
-- Access: Free
-- Pattern: funnel / retention logic (multi-step)
-- Summary: Compute advanced patient support funnel metrics by linking multiple steps and applying the Part 3 constraints.
-- Notes: De-duplicate patient-step events; use CTEs for readability; ensure step ordering and time windows match the spec.
-- Dialect: PostgreSQL

WITH call_history AS (
  SELECT 
    policy_holder_id,
    call_date,
    LAG(call_date) OVER (
      PARTITION BY policy_holder_id
      ORDER BY call_date
    ) AS previous_call,
    ROUND(
      EXTRACT(
        EPOCH FROM call_date 
        - LAG(call_date) OVER (
        PARTITION BY policy_holder_id
        ORDER BY call_date)
      )/(24*60*60)
    , 2
    ) AS time_diff_days
  FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS count_policy_holder
FROM call_history
WHERE time_diff_days <= 7;