-- Title: IBM db2 Product Analytics
-- Company: IBM
-- Difficulty: Easy
-- Pattern: left join + histogram
-- Summary: Build a distribution of employees by unique query count in Q3 2023.
-- Notes: Preserve employees with zero queries, count distinct query IDs, then group by that count.

WITH employee_queries AS (
  SELECT
    e.employee_id,
    COUNT(DISTINCT q.query_id) AS unique_queries
  FROM employees AS e
  LEFT JOIN queries AS q
    ON e.employee_id = q.employee_id
   AND q.query_starttime >= TIMESTAMP '2023-07-01'
   AND q.query_starttime < TIMESTAMP '2023-10-01'
  GROUP BY e.employee_id
)

SELECT
  unique_queries,
  COUNT(*) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;
