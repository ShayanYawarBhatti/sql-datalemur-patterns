-- Title: Second Day Confirmation
-- Company: TikTok
-- Difficulty: Easy
-- Pattern: join + date interval
-- Summary: Return users who confirmed exactly one day after signup.
-- Notes: Join through email_id and compare confirmation date with signup date plus one day.

SELECT DISTINCT user_id
FROM emails
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = signup_date + INTERVAL '1 DAY'
  AND signup_action = 'Confirmed'
