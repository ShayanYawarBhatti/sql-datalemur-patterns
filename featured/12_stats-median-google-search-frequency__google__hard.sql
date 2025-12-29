-- Title: Median Google Search Frequency
-- Company: Google
-- Difficulty: Hard
-- Access: Free
-- Pattern: median from frequency table (cumulative distribution)
-- Summary: Compute the median number of searches when the data is provided as (searches, num_users).
-- Notes: Use cumulative sums to locate the middle position(s). For even totals, average the two middle values.
-- Dialect: PostgreSQL

WITH searches_expanded AS (
  SELECT searches
  FROM search_frequency
  GROUP BY 
    searches, 
    GENERATE_SERIES(1, num_users))

SELECT 
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY searches)::DECIMAL, 1) AS  median
FROM searches_expanded;