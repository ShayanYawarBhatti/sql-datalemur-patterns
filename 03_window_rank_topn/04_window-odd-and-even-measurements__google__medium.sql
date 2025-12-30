-- Title: Odd and Even Measurements
-- Company: Google
-- Difficulty: Medium
-- Access: Free
-- Pattern: window (ROW_NUMBER) + conditional aggregation
-- Summary: Split ordered measurements into odd/even positions and compute separate sums (or metrics) for each group.
-- Notes: Use ROW_NUMBER() ordered by measurement_time; odd = rn % 2 = 1, even = 0. Then aggregate per day if required.
-- Dialect: PostgreSQL

WITH ranked_measurements AS (
SELECT
  CAST(measurement_time AS DATE) AS measurement_day,
  measurement_value,
  ROW_NUMBER() OVER (
  PARTITION BY CAST(measurement_time AS DATE)
  ORDER BY measurement_time) AS measurement_num
FROM measurements
)

SELECT
  measurement_day,
  SUM(CASE WHEN measurement_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum,
  SUM(CASE WHEN measurement_num % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum
FROM ranked_measurements
GROUP BY measurement_day