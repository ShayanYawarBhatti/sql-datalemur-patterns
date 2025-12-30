-- Title: Same Week Purchases
-- Company: Etsy
-- Difficulty: Hard
-- Access: Premium
-- Pattern: time bucketing + repeat behavior
-- Summary: Identify users (or items) with repeat purchases within the same calendar week by bucketing purchases to week_start and applying the Part constraints.
-- Notes: DATE_TRUNC('week', purchase_date) for week bucket; de-duplicate where needed; apply HAVING/joins for repeat logic.
-- Dialect: PostgreSQL

SELECT ROUND(
  100.0 * 
    COUNT(DISTINCT purchases.user_id) / 
    COUNT(DISTINCT signups.user_id), 2) AS same_week_purchases_pct
FROM signups
LEFT JOIN user_purchases AS purchases
  ON signups.user_id = purchases.user_id
WHERE purchases.purchase_date IS NULL
  OR (purchases.purchase_date BETWEEN signups.signup_date 
  AND (signups.signup_date + '7 days'::INTERVAL));