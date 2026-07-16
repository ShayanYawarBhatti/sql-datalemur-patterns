-- Title: Second Highest Salary
-- Company: FAANG
-- Difficulty: Medium
-- Pattern: scalar subquery + distinct maximum
-- Summary: Return the second-highest distinct salary.
-- Notes: Find the highest salary below the overall maximum; the result is NULL when none exists.

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
