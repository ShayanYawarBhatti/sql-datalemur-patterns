-- Title: Same Week Purchases
-- Company: Etsy
-- Difficulty: Hard
-- Pattern: conversion rate + conditional join
-- Summary: Calculate the share of signups making a purchase within seven days.
-- Notes: Keep the date condition in the LEFT JOIN so every signup remains in the denominator.

SELECT
  ROUND(
    100.0 * COUNT(DISTINCT purchases.user_id)
    / NULLIF(COUNT(DISTINCT signups.user_id), 0),
    2
  ) AS same_week_purchases_pct
FROM signups
LEFT JOIN user_purchases AS purchases
  ON signups.user_id = purchases.user_id
 AND purchases.purchase_date BETWEEN signups.signup_date
                                 AND signups.signup_date + INTERVAL '7 days';
