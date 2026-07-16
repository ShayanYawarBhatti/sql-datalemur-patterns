-- Title: Top Three Salaries
-- Company: FAANG
-- Difficulty: Medium
-- Pattern: DENSE_RANK + top N per group
-- Summary: Return employees in the top three distinct salaries within each department.
-- Notes: DENSE_RANK preserves salary ties and resets within each department.

WITH ranked_salary AS (
  SELECT
    name,
    salary, 
    department_id, 
    DENSE_RANK() OVER(
    PARTITION BY department_id ORDER BY salary DESC) AS ranking
  FROM employee
)

SELECT 
  d.department_name,
  s.name,
  s.salary
FROM ranked_salary as s 
INNER JOIN department as d 
ON s.department_id = d.department_id
WHERE s.ranking <= 3
ORDER BY d.department_name ASC, s.salary DESC, s.name ASC;
