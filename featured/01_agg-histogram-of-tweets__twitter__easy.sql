-- Title: Histogram of Tweets
-- Company: Twitter
-- Difficulty: Easy
-- Access: Free
-- Pattern: aggregation / histogram
-- Summary: Build a histogram of how many tweets each user posted in 2022 by counting tweets per user, then counting users per tweet-count bucket.
-- Notes: Step 1 aggregates tweets per user; Step 2 turns it into a histogram (bucket -> number of users).
-- Dialect: PostgreSQL

WITH total_tweets AS (
  SELECT
    user_id,
    COUNT(tweet_id) AS tweet_count_per_user
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
  GROUP BY user_id
)

SELECT 
  tweet_count_per_user AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM total_tweets
GROUP BY tweet_count_per_user