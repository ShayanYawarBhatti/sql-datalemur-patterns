-- Title: Laptop vs. Mobile Viewership
-- Company: NY Times
-- Difficulty: Easy
-- Access: Free
-- Pattern: conditional aggregation
-- Summary: Count total views from laptop vs. mobile devices using CASE-based aggregation.
-- Notes: Use SUM(CASE ...) for each device group; treat phone+tablet as "mobile".
-- Dialect: PostgreSQL

SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;