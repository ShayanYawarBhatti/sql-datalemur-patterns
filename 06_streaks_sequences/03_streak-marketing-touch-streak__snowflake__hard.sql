-- Title: Marketing Touch Streak
-- Company: Snowflake
-- Difficulty: Hard
-- Pattern: consecutive-week self-join + EXISTS
-- Summary: Return contacts with touches in three consecutive weeks and a trial request.
-- Notes: Deduplicate contact-week pairs, match three-week sequences, then verify trial_request.

WITH weekly_touches AS (
  SELECT DISTINCT
    contact_id,
    DATE_TRUNC('week', event_date) AS week_start
  FROM marketing_touches
),
streak_contacts AS (
  SELECT DISTINCT first_week.contact_id
  FROM weekly_touches AS first_week
  INNER JOIN weekly_touches AS second_week
    ON first_week.contact_id = second_week.contact_id
   AND second_week.week_start = first_week.week_start + INTERVAL '1 week'
  INNER JOIN weekly_touches AS third_week
    ON first_week.contact_id = third_week.contact_id
   AND third_week.week_start = first_week.week_start + INTERVAL '2 weeks'
)

SELECT DISTINCT contacts.email
FROM streak_contacts
INNER JOIN crm_contacts AS contacts
  ON streak_contacts.contact_id = contacts.contact_id
WHERE EXISTS (
  SELECT 1
  FROM marketing_touches AS touches
  WHERE touches.contact_id = streak_contacts.contact_id
    AND touches.event_type = 'trial_request'
);
