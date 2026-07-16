-- Title: Consecutive Filing Years
-- Company: Intuit
-- Difficulty: Hard
-- Pattern: consecutive-year self-join
-- Summary: Return users with TurboTax filings in at least three consecutive years.
-- Notes: Deduplicate user-year pairs, then match year, year plus one, and year plus two.

WITH filing_years AS (
  SELECT DISTINCT
    user_id,
    EXTRACT(YEAR FROM filing_date)::INT AS filing_year
  FROM filed_taxes
  WHERE product ILIKE 'turbotax%'
)

SELECT DISTINCT first_year.user_id
FROM filing_years AS first_year
INNER JOIN filing_years AS second_year
  ON first_year.user_id = second_year.user_id
 AND second_year.filing_year = first_year.filing_year + 1
INNER JOIN filing_years AS third_year
  ON first_year.user_id = third_year.user_id
 AND third_year.filing_year = first_year.filing_year + 2
ORDER BY first_year.user_id;
