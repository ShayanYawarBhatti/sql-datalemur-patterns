-- Title: Compressed Median
-- Company: Alibaba
-- Difficulty: Hard
-- Access: Premium
-- Pattern: weighted median (frequency table) / cumulative distribution
-- Summary: Compute the median from a compressed distribution (value, frequency) by locating the middle position(s) in the cumulative frequency.
-- Notes: Use cumulative SUM(num_users) ordered by value; for even totals, average the two middle values. Keep edge cases explicit.
-- Dialect: PostgreSQL

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