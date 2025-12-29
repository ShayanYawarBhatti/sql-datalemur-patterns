-- Title: Duplicate Job Listings
-- Company: LinkedIn
-- Difficulty: Easy
-- Access: Free
-- Pattern: deduplication via GROUP BY
-- Summary: Identify companies with duplicate job listings by counting repeated titles per company.
-- Notes: Group by company and title; duplicates are where COUNT(*) > 1. Then count how many duplicate titles each company has.
-- Dialect: PostgreSQL

WITH job_count_cte AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT 
  COUNT(company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;