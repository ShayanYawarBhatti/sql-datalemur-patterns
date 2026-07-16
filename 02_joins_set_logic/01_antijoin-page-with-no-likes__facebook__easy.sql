-- Title: Page With No Likes
-- Company: Facebook
-- Difficulty: Easy
-- Pattern: anti-join
-- Summary: Return pages with no matching likes.
-- Notes: LEFT JOIN and filter unmatched page IDs; NOT EXISTS is an equivalent approach.

SELECT 
  pages.page_id
FROM pages
 LEFT JOIN page_likes
 ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL
ORDER BY page_id;
