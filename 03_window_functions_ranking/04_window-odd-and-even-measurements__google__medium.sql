-- Title: Odd and Even Measurements
-- Company: Google
-- Difficulty: Medium
-- Pattern: row numbering + conditional aggregation
-- Summary: Sum odd- and even-positioned measurements for each day.
-- Notes: Number measurements chronologically within each day, then aggregate by parity.

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
