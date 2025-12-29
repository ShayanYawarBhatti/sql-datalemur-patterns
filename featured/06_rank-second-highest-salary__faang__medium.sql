-- Title: Second Highest Salary
-- Company: FAANG
-- Difficulty: Medium
-- Access: Free
-- Pattern: ranking (DENSE_RANK) / top-N
-- Summary: Return the second highest distinct salary by ranking salaries in descending order.
-- Notes: Use DENSE_RANK so ties share the same rank; filter rank = 2.
-- Dialect: PostgreSQL

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT 
  MAX(salary) 
FROM employee);