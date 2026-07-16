-- Title: Compressed Mean
-- Company: Alibaba
-- Difficulty: Easy
-- Pattern: weighted aggregation
-- Summary: Calculate a weighted mean from value-frequency pairs.
-- Notes: Multiply each item count by its frequency, divide by total frequency, and round once.

SELECT
  ROUND(
    SUM(CAST(item_count AS decimal) * order_occurrences)/SUM(order_occurrences)
  , 1
  ) AS mean
FROM items_per_order;
