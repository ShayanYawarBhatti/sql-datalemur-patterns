-- Title: Advertiser Status
-- Company: Facebook
-- Difficulty: Hard
-- Pattern: full outer join + CASE
-- Summary: Derive each advertiser's new status from prior status and current payment activity.
-- Notes: FULL OUTER JOIN retains new, active, and churned users; CASE applies the transition rules.

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
