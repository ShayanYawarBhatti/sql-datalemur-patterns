-- Title: Compressed Mode
-- Company: Alibaba
-- Difficulty: Medium
-- Access: Free
-- Pattern: weighted aggregation (mode from frequency table)
-- Summary: Find the value (search count) with the highest frequency (num_users) from a compressed distribution.
-- Notes: If ties exist, return the smallest value unless your solution specifies a different tie-break.
-- Dialect: PostgreSQL

SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (
  SELECT MAX(order_occurrences) 
  FROM items_per_order 
)
ORDER BY item_count