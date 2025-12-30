-- Title: Invalid Search Results
-- Company: Google
-- Difficulty: Medium
-- Access: Premium
-- Pattern: data cleaning + validation logic
-- Summary: Flag or filter invalid search results by applying validity rules (e.g., mismatched IDs, missing fields, or incorrect associations) and returning the required fields.
-- Notes: Implement rules as CASE expressions or filtered joins; keep conditions readable with CTEs.
-- Dialect: PostgreSQL

SELECT
  country, 
  SUM(num_search) AS total_search,
  ROUND(
  SUM(num_search * invalid_result_pct)/SUM(num_search)
  , 2) AS invalid_searches_pct
FROM search_category
WHERE invalid_result_pct IS NOT NULL
GROUP BY country
ORDER BY country ASC

/*
In cases where countries have search attempts but do not have a percentage 
of invalid searches in invalid_result_pct, it should be excluded — and 
vice versa. Therefore, we do IS NOT NULL
*/