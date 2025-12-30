-- Title: Compensation Outliers
-- Company: Accenture
-- Difficulty: Medium
-- Access: Premium
-- Pattern: outlier detection (IQR / percentile) + filtering
-- Summary: Identify compensation outliers by computing percentile-based thresholds (e.g., IQR) and filtering values outside bounds.
-- Notes: Use percentile functions (PERCENTILE_CONT) if available; compute Q1/Q3 then apply [Q1 - 1.5*IQR, Q3 + 1.5*IQR].
-- Dialect: PostgreSQL

WITH payouts AS (SELECT 
  employee_id,
  salary,
  title,
  AVG(salary) OVER (PARTITION BY title) * 2 AS double_average,
  AVG(salary) OVER (PARTITION BY title) / 2 AS half_average
FROM employee_pay)

SELECT 
  employee_id,
  salary,
  (CASE 
        WHEN salary > double_average THEN 'Overpaid'
        WHEN salary < half_average THEN 'Underpaid'
  END) AS outlier_status
FROM payouts
WHERE 
      salary > double_average
      OR salary < half_average;