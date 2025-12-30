-- Title: Patient Support Analysis (Part 4)
-- Company: UnitedHealth
-- Difficulty: Hard
-- Access: Free
-- Pattern: funnel / cohort analysis (full pipeline)
-- Summary: Finalize the patient support funnel by computing Part 4 metrics that combine multiple steps and constraints.
-- Notes: Use staged CTEs; verify join keys + step sequencing; enforce any time-window logic carefully.
-- Dialect: PostgreSQL


WITH long_calls AS (
  SELECT 
    EXTRACT(YEAR from call_date) AS yr,
    EXTRACT(MONTH from call_date) AS mth,
    COUNT(case_id) AS curr_mth_calls,
    LAG(COUNT(case_id)) OVER (  
    ORDER BY EXTRACT(MONTH FROM call_date)) AS prev_mth_calls
  FROM callers
  WHERE call_duration_secs > 300
  GROUP BY 
    EXTRACT(YEAR from call_date),
    EXTRACT(MONTH from call_date)
)

SELECT 
  yr, 
  mth, 
  ROUND(100.0 * (curr_mth_calls - prev_mth_calls)/prev_mth_calls , 1) AS long_calls_growth_pct
FROM long_calls
ORDER BY 
  yr, 
  mth;