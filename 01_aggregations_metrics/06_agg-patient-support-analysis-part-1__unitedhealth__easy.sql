-- Title: Patient Support Analysis (Part 1)
-- Company: UnitedHealth
-- Difficulty: Easy
-- Pattern: aggregation + HAVING
-- Summary: Count policyholders with at least three support calls.
-- Notes: Aggregate calls per policyholder, retain qualifying groups, then count them.

SELECT 
  COUNT(policy_holder_id) AS policy_holder_count
FROM (
  SELECT 
    policy_holder_id,
    COUNT(case_id) AS call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
) AS call_records;
