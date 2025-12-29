-- Title: Top Three Salaries
-- Company: FAANG
-- Difficulty: Medium
-- Access: Free
-- Pattern: ranking (DENSE_RANK)
-- Summary: Return employees who earn one of the top 3 distinct salaries.
-- Notes: DENSE_RANK ranks distinct salaries (ties share rank); filter rnk <= 3.
-- Dialect: PostgreSQL


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