-- Title: Second Day Confirmation
-- Company: TikTok
-- Difficulty: Easy
-- Access: Free
-- Pattern: self-join / date logic
-- Summary: Identify users who confirmed on the day after signup by joining events per user and comparing dates (signup_date + 1 day).
-- Notes: Use DATE comparisons carefully; depending on schema this can be a self-join or conditional aggregation.
-- Dialect: PostgreSQL

SELECT DISTINCT user_id
FROM emails
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = signup_date + INTERVAL '1 DAY'
  AND signup_action = 'Confirmed'