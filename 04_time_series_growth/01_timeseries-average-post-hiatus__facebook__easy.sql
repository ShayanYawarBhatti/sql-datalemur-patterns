-- Title: Average Post Hiatus (Part 1)
-- Company: Facebook
-- Difficulty: Easy
-- Pattern: date aggregation
-- Summary: Calculate days between each user's first and last 2021 post.
-- Notes: Filter 2021, require multiple posts, and subtract the minimum date from the maximum.

SELECT
  user_id,
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE post_date >= DATE '2021-01-01'
  AND post_date < DATE '2022-01-01'
GROUP BY user_id
HAVING COUNT(*) > 1;
