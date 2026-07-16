-- Title: Histogram of Tweets
-- Company: Twitter
-- Difficulty: Easy
-- Pattern: two-stage aggregation + histogram
-- Summary: Count users in each 2022 tweet-frequency bucket.
-- Notes: First count tweets per user, then count users per tweet count.

WITH total_tweets AS (
  SELECT
    user_id,
    COUNT(*) AS tweet_count_per_user
  FROM tweets
  WHERE tweet_date >= DATE '2022-01-01'
    AND tweet_date < DATE '2023-01-01'
  GROUP BY user_id
)

SELECT
  tweet_count_per_user AS tweet_bucket,
  COUNT(*) AS users_num
FROM total_tweets
GROUP BY tweet_count_per_user
ORDER BY tweet_bucket;
