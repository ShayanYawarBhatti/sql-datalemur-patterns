-- Title: Swapped Food Delivery
-- Company: Zomato
-- Difficulty: Medium
-- Access: Free
-- Pattern: business logic + joins
-- Summary: Detect orders where deliveries were swapped/mismatched by comparing the expected vs actual delivered items and returning impacted orders/users.
-- Notes: Typically requires joining orders to deliveries and flagging mismatches; keep mismatch rules explicit with CASE/CTEs.
-- Dialect: PostgreSQL

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