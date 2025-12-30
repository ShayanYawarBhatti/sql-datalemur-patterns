-- Title: Patient Support Analysis (Part 2)
-- Company: UnitedHealth
-- Difficulty: Medium
-- Access: Free
-- Pattern: funnel / cohort-style aggregation
-- Summary: Extend Part 1 by computing the next-stage metric(s) using conditional aggregation and/or joins between support steps.
-- Notes: Ensure patients are counted once per step; watch join conditions and date filters; follow Part 2 output spec.
-- Dialect: PostgreSQL

WITH uncategorised_callers AS (
  SELECT 
    COUNT(case_id) AS uncategorised_calls
  FROM callers
  WHERE call_category = 'n/a' OR call_category IS NULL
)

SELECT
  ROUND(100.0 * uncategorised_calls/
  (SELECT COUNT(case_id) FROM callers), 1) AS uncategorised_call_pct
FROM uncategorised_callers;