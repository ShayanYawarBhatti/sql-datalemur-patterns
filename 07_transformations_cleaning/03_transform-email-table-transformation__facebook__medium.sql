-- Title: Email Table Transformation
-- Company: Facebook
-- Difficulty: Medium
-- Access: Premium
-- Pattern: table transformation (reshape / pivot-like)
-- Summary: Transform an email events table into the required output shape by aggregating and/or pivoting event types into columns.
-- Notes: Use conditional aggregation (SUM/COUNT with CASE) to pivot; ensure one row per key (e.g., user_id/date).
-- Dialect: PostgreSQL

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