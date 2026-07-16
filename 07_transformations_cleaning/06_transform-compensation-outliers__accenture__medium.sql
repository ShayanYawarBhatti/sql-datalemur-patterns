-- Title: Compensation Outliers
-- Company: Accenture
-- Difficulty: Medium
-- Pattern: window average + classification
-- Summary: Label salaries above twice or below half the title-level average.
-- Notes: Compute the title average once, compare each salary, and return only outliers.

WITH payouts AS (
  SELECT
    employee_id,
    salary,
    AVG(salary) OVER (PARTITION BY title) AS avg_title_salary
  FROM employee_pay
)

SELECT
  employee_id,
  salary,
  CASE
    WHEN salary > 2 * avg_title_salary THEN 'Overpaid'
    WHEN salary < 0.5 * avg_title_salary THEN 'Underpaid'
  END AS outlier_status
FROM payouts
WHERE salary > 2 * avg_title_salary
   OR salary < 0.5 * avg_title_salary;
