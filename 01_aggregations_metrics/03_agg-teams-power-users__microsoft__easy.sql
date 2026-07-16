-- Title: Teams Power Users
-- Company: Microsoft
-- Difficulty: Easy
-- Pattern: aggregation + top N
-- Summary: Return the two users who sent the most messages in August 2022.
-- Notes: Filter with a date range, count per sender, sort descending, and limit to two.

SELECT
  sender_id,
  COUNT(*) AS count_messages
FROM messages
WHERE sent_date >= DATE '2022-08-01'
  AND sent_date < DATE '2022-09-01'
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2;
