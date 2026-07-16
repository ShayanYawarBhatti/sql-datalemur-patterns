-- Title: Patient Support Analysis (Part 2)
-- Company: UnitedHealth
-- Difficulty: Medium
-- Pattern: conditional aggregation + rate
-- Summary: Calculate the percentage of calls with missing or uncategorized categories.
-- Notes: A single aggregation can count qualifying calls and all calls.

SELECT
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE call_category = 'n/a' OR call_category IS NULL
    ) / NULLIF(COUNT(*), 0),
    1
  ) AS uncategorised_call_pct
FROM callers;
