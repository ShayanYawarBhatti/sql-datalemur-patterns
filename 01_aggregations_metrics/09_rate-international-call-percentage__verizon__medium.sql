-- Title: International Call Percentage
-- Company: Verizon
-- Difficulty: Medium
-- Pattern: conditional aggregation + percentage
-- Summary: Calculate the percentage of calls that cross country boundaries.
-- Notes: Join both participants, count differing country IDs, and divide by all calls.

SELECT
  ROUND(
    100.0 * SUM(
      CASE WHEN caller.country_id <> receiver.country_id THEN 1 ELSE 0 END
    ) / COUNT(*),
    1
  ) AS international_calls_pct
FROM phone_calls AS calls
INNER JOIN phone_info AS caller
  ON calls.caller_id = caller.caller_id
INNER JOIN phone_info AS receiver
  ON calls.receiver_id = receiver.caller_id;
