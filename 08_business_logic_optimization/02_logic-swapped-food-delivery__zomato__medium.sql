-- Title: Swapped Food Delivery
-- Company: Zomato
-- Difficulty: Medium
-- Pattern: CASE + row swapping
-- Summary: Swap adjacent order IDs while leaving an unmatched final odd order unchanged.
-- Notes: Parity and total row count map each order to its paired position.

WITH orders_count AS (
  SELECT COUNT(order_id) AS total_orders
  FROM orders
)

SELECT 
  CASE 
    WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1
    WHEN order_id % 2 != 0 AND order_id = total_orders THEN order_id
    ELSE order_id - 1
  END AS corrected_order_id,
  item
FROM orders
CROSS JOIN orders_count
ORDER BY corrected_order_id;
