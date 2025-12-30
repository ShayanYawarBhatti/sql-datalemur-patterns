-- Title: Unfinished Parts
-- Company: Tesla
-- Difficulty: Easy
-- Access: Free
-- Pattern: join + filter
-- Summary: Identify parts that are unfinished by joining the parts table to the assembly/finish status table and filtering on incomplete status.
-- Notes: Depending on schema, this may be a LEFT JOIN + NULL filter or a direct WHERE filter on finish_date/status.
-- Dialect: PostgreSQL

SELECT 
  part, 
  assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
