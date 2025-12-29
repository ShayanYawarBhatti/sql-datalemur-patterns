-- Title: Teams Power Users
-- Company: Microsoft
-- Difficulty: Easy
-- Access: Free
-- Pattern: aggregation + HAVING
-- Summary: Find users who sent a high volume of messages by aggregating messages per sender and filtering with HAVING.
-- Notes: Use COUNT(*) (or COUNT(message_id)) per sender; filter threshold in HAVING.
-- Dialect: PostgreSQL

SELECT  
  sender_id, 
  COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH from sent_date) = '08' AND EXTRACT(YEAR from sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2;