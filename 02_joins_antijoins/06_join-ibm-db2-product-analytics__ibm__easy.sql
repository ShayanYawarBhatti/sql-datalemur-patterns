-- Title: IBM db2 Product Analytics
-- Company: IBM
-- Difficulty: Easy
-- Access: Free
-- Pattern: join + filter + distinct
-- Summary: Identify the required set of users/accounts/products for DB2 analytics by joining the relevant tables and filtering to DB2 product activity.
-- Notes: Use DISTINCT to avoid duplicates; verify join keys (user_id/account_id/product_id) and the DB2 product filter.
-- Dialect: PostgreSQL

WITH employee_queries AS (
  SELECT
    e.employee_id, 
    COALESCE(COUNT(DISTINCT q.query_id), 0) AS unique_queries
  FROM employees AS e
  LEFT JOIN queries AS q
    ON e.employee_id = q.employee_id
      AND q.query_starttime BETWEEN '2023-07-01 00:00:00' 
      AND '2023-10-1 00:00:00'
  GROUP BY e.employee_id
)

SELECT
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;