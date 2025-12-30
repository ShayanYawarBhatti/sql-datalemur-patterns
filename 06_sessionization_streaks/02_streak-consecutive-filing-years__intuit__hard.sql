-- Title: Consecutive Filing Years
-- Company: Intuit
-- Difficulty: Hard
-- Access: Free
-- Pattern: streaks (gaps-and-islands) / consecutive sequences
-- Summary: Find users with consecutive-year filing sequences by grouping years into uninterrupted runs and selecting qualifying streaks.
-- Notes: Reduce to distinct (user_id, year) first; use ROW_NUMBER and (year - rn) to define streak groups; filter by required streak length.
-- Dialect: PostgreSQL

WITH turbotax_filings_cte AS (
  SELECT
    user_id,
      DATE_TRUNC('year', filing_date) AS filing_year,
      LAG(DATE_TRUNC('year', filing_date)) OVER (
        PARTITION BY user_id 
        ORDER BY filing_date) AS previous_year,
      LEAD(DATE_TRUNC('year', filing_date)) OVER (
        PARTITION BY user_id 
        ORDER BY filing_date) AS following_year
  FROM filed_taxes
  WHERE LOWER(product) LIKE 'turbotax%'
)

SELECT user_id
FROM turbotax_filings_cte
WHERE previous_year = filing_year - interval '1 year'
  OR following_year = filing_year + interval '1 year'
GROUP BY user_id
HAVING COUNT(filing_year) >= 3;