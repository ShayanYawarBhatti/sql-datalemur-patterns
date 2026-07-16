-- Title: Compressed Median
-- Company: Alibaba
-- Difficulty: Hard
-- Pattern: weighted median
-- Summary: Calculate the median item count directly from a compressed frequency table.
-- Notes: Cumulative frequencies identify one or both middle values, which are then averaged.

WITH running_orders AS (
SELECT
  *,
  SUM(order_occurrences) OVER (
    ORDER BY item_count ASC) as running_sum,
  SUM(order_occurrences) OVER () AS total_sum
FROM items_per_order
)

SELECT ROUND(AVG(item_count)::DECIMAL,1) AS median
FROM running_orders
WHERE total_sum <= 2 * running_sum
  AND total_sum >= 2 * (running_sum - order_occurrences);
