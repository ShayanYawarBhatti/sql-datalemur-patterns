-- Title: Page With No Likes
-- Company: Facebook
-- Difficulty: Easy
-- Access: Free
-- Pattern: anti-join / left join + NULL filter
-- Summary: Return pages that have no likes by left-joining pages to likes and filtering where the like side is NULL.
-- Notes: Use LEFT JOIN (or NOT EXISTS). Be careful to join on page_id and filter NULL from the joined table.
-- Dialect: PostgreSQL

SELECT 
  pages.page_id
FROM pages
 LEFT JOIN page_likes
 ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL
ORDER BY page_id;


