-- Title: User Shopping Sprees
-- Company: Amazon
-- Difficulty: Medium
-- Pattern: consecutive-date self-join
-- Summary: Return users with purchases on three consecutive calendar days.
-- Notes: Join three copies by user and consecutive dates; DISTINCT removes duplicate triplets.

SELECT DISTINCT t1.user_id
FROM transactions AS t1
INNER JOIN transactions AS t2
  ON t1.user_id = t2.user_id
 AND t2.transaction_date::DATE = t1.transaction_date::DATE + 1
INNER JOIN transactions AS t3
  ON t1.user_id = t3.user_id
 AND t3.transaction_date::DATE = t1.transaction_date::DATE + 2
ORDER BY t1.user_id;
