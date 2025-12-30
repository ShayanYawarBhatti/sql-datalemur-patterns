-- Title: Advertiser Status
-- Company: Facebook
-- Difficulty: Hard
-- Access: Free
-- Pattern: retention / status classification over time
-- Summary: Classify advertisers by whether they are new, existing, retained, or churned based on activity across time periods.
-- Notes: Typically solved by comparing current-period advertisers to prior-period advertisers using joins/CTEs; ensure distinct advertiser_id per period.
-- Dialect: PostgreSQL

SELECT 
  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
  CASE 
    WHEN paid IS NULL THEN 'CHURN' 
    WHEN paid IS NOT NULL AND advertiser.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
    WHEN paid IS NOT NULL AND advertiser.status = 'CHURN' THEN 'RESURRECT'
    WHEN paid IS NOT NULL AND advertiser.status IS NULL THEN 'NEW'
  END AS new_status
FROM advertiser
FULL OUTER JOIN daily_pay
  ON advertiser.user_id = daily_pay.user_id
ORDER BY user_id;