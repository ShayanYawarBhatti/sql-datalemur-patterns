-- Title: Patient Support Analysis (Part 1)
-- Company: UnitedHealth
-- Difficulty: Easy
-- Access: Free
-- Pattern: funnel / retention-style aggregation
-- Summary: Compute patient support metrics by aggregating events per patient and filtering to the relevant support steps for Part 1.
-- Notes: Keep logic minimal and explicit; use DISTINCT patient_id when required; follow the output spec for Part 1 exactly.
-- Dialect: PostgreSQL

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

