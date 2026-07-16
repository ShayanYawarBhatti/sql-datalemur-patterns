-- Title: Unfinished Parts
-- Company: Tesla
-- Difficulty: Easy
-- Pattern: NULL filtering
-- Summary: Return assembly steps that do not have a finish date.
-- Notes: A direct IS NULL filter is sufficient; no join is required.

SELECT 
  part, 
  assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
