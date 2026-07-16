-- Title: App Click-through Rate (CTR)
-- Company: Facebook
-- Difficulty: Easy
-- Pattern: conditional aggregation + rate
-- Summary: Calculate click-through rate per app for 2022.
-- Notes: Use filtered counts, protect against zero impressions, and filter with a date range.

SELECT
  app_id,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE event_type = 'click')
    / NULLIF(COUNT(*) FILTER (WHERE event_type = 'impression'), 0),
    2
  ) AS ctr_rate
FROM events
WHERE timestamp >= DATE '2022-01-01'
  AND timestamp < DATE '2023-01-01'
GROUP BY app_id;
