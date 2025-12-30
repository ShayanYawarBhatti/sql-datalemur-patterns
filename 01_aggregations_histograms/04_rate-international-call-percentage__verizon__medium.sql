-- Title: International Call Percentage
-- Company: Verizon
-- Difficulty: Medium
-- Access: Free
-- Pattern: conditional aggregation (percentage)
-- Summary: Compute the percentage of calls that are international by dividing international call counts by total calls.
-- Notes: Use conditional COUNT/SUM with CASE; cast to numeric to avoid integer division; round as required.
-- Dialect: PostgreSQL

SELECT
  SUM(CASE WHEN callers.country_id <> receiver.country_id THEN 1 ElSE NULL END) AS international_calls,
  COUNT(*) AS total_calls
FROM phone_calls AS calls
LEFT JOIN phone_info AS callers
  ON calls.caller_id = callers.caller_id
LEFT JOIN phone_info AS receiver
  ON calls.receiver_id = receiver.caller_id;
