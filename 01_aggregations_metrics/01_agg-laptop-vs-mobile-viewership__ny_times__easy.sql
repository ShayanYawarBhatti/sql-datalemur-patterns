-- Title: Laptop vs. Mobile Viewership
-- Company: NY Times
-- Difficulty: Easy
-- Pattern: conditional aggregation
-- Summary: Count laptop views separately from phone and tablet views.
-- Notes: CASE expressions convert device categories into two totals in one scan.

SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
