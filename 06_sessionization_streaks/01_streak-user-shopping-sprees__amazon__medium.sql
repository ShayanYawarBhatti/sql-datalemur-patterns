-- Title: User Shopping Sprees
-- Company: Amazon
-- Difficulty: Medium
-- Access: Free
-- Pattern: streaks (gaps-and-islands)
-- Summary: Identify users who made purchases on consecutive days (a shopping spree) by grouping dates into consecutive-day islands.
-- Notes: De-duplicate to (user_id, purchase_date) first; use ROW_NUMBER and (date - rn) trick to form streak groups.
-- Dialect: PostgreSQL


-- Identify users who bought items on 3 consecutive calendar days
SELECT DISTINCT t1.user_id          -- DISTINCT ensures each user appears only once
FROM transactions AS t1

-- t2 = transaction exactly 1 day after t1
JOIN transactions AS t2
  ON t1.user_id = t2.user_id        -- must be the SAME user
 AND DATE(t2.transaction_date) = DATE(t1.transaction_date) + INTERVAL '1 day'

-- t3 = transaction exactly 2 days after t1
JOIN transactions AS t3
  ON t1.user_id = t3.user_id        -- still same user
 AND DATE(t3.transaction_date) = DATE(t1.transaction_date) + INTERVAL '2 day'

ORDER BY t1.user_id;

/*
We treat the table as three separate copies:
t1 = Day 1
t2 = Day 1 + 1
t3 = Day 1 + 2
For each row in t1, the query checks:
Does the same user have a transaction on the next day? (t2)
Does the same user have a transaction on the day after that? (t3)
*/