-- Title: Median Google Search Frequency
-- Company: Google
-- Difficulty: Hard
-- Pattern: frequency expansion + percentile
-- Summary: Calculate median searches from a compressed frequency table.
-- Notes: Expand each value by user count and apply PERCENTILE_CONT; simple but memory-heavy at large scale.

SELECT
  ROUND(
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY searches)::DECIMAL,
    1
  ) AS median
FROM search_frequency
CROSS JOIN LATERAL GENERATE_SERIES(1, num_users);
