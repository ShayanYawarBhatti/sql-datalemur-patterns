-- Title: Patient Support Analysis (Part 3)
-- Company: UnitedHealth
-- Difficulty: Hard
-- Pattern: LAG + interval comparison
-- Summary: Count policyholders who made another call within seven days.
-- Notes: Compare each call with the policyholder's previous call and count distinct matches.

WITH call_history AS (
  SELECT
    policy_holder_id,
    call_date - LAG(call_date) OVER (
      PARTITION BY policy_holder_id
      ORDER BY call_date
    ) AS time_since_previous
  FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS count_policy_holder
FROM call_history
WHERE time_since_previous <= INTERVAL '7 days';
