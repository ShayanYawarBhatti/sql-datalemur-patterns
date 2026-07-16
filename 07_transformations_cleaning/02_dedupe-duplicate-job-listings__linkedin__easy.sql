-- Title: Duplicate Job Listings
-- Company: LinkedIn
-- Difficulty: Easy
-- Pattern: deduplication + distinct count
-- Summary: Count companies with at least one repeated title-and-description listing.
-- Notes: Group identical listings, retain counts above one, then count distinct companies.

WITH duplicate_listings AS (
  SELECT
    company_id
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM duplicate_listings;
