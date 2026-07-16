-- Title: Compressed Mode
-- Company: Alibaba
-- Difficulty: Medium
-- Pattern: sort + limit
-- Summary: Return the item count with the highest occurrence frequency.
-- Notes: Sort by frequency descending and item count ascending for a deterministic tie-break.

SELECT item_count AS mode
FROM items_per_order
ORDER BY order_occurrences DESC, item_count
LIMIT 1;
