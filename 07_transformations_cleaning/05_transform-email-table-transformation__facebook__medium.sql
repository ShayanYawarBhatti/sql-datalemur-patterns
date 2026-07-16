-- Title: Email Table Transformation
-- Company: Facebook
-- Difficulty: Medium
-- Pattern: conditional aggregation + pivot
-- Summary: Pivot email types into personal, business, and recovery columns per user.
-- Notes: CASE selects each type and MAX collapses rows into one user record.

SELECT
  user_id,
  MAX(CASE WHEN email_type = 'personal' THEN email
    ELSE NULL END) AS personal,
  MAX(CASE WHEN email_type = 'business' THEN email
    ELSE NULL END) AS business,
  MAX(CASE WHEN email_type = 'recovery' THEN email
    ELSE NULL END) AS recovery
FROM users
GROUP BY user_id
ORDER BY user_id;
