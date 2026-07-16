# Featured SQL Solutions

A focused review path through the repository’s most representative analytical work. Each entry links to the canonical solution in its pattern folder, so the repository keeps one maintained copy of every query.

## Analytical depth

1. [Year-over-Year Growth Rate](../04_time_series_growth/07_timeseries-yoy-growth-rate__wayfair__hard.sql) — annual grain alignment followed by window-based growth comparison
2. [Active User Retention](../05_retention_conversion/05_retention-active-user-retention__facebook__hard.sql) — exact date scoping, cohort preservation, and user-level retention logic
3. [Marketing Touch Streak](../06_streaks_sequences/03_streak-marketing-touch-streak__snowflake__hard.sql) — qualifying behavior across three consecutive weeks
4. [Median Google Search Frequency](../01_aggregations_metrics/13_stats-median-google-search-frequency__google__hard.sql) — median calculation from compressed frequency data
5. [Maximize Prime Item Inventory](../08_business_logic_optimization/04_optimize-maximize-prime-item-inventory__amazon__hard.sql) — constrained allocation expressed through closed-form business logic

## Window functions and ranking

6. [Top Three Salaries](../03_window_functions_ranking/02_rank-top-three-salaries__faang__medium.sql) — dense ranking with ties inside departments
7. [User’s Third Transaction](../03_window_functions_ranking/01_window-users-third-transaction__uber__medium.sql) — nth-row selection within each user history
8. [Highest-Grossing Items](../03_window_functions_ranking/03_rank-highest-grossing-items__amazon__medium.sql) — top-N analysis within product categories

## Metrics, conversion, and data quality

9. [Signup Activation Rate](../05_retention_conversion/02_conversion-signup-activation-rate__tiktok__medium.sql) — conversion measurement with duplicate-event protection
10. [Duplicate Job Listings](../07_transformations_cleaning/02_dedupe-duplicate-job-listings__linkedin__easy.sql) — duplicate-group detection and company-level counting
11. [Second Highest Salary](../01_aggregations_metrics/14_stats-second-highest-salary__faang__medium.sql) — second distinct maximum through a concise scalar subquery
12. [Histogram of Tweets](../01_aggregations_metrics/02_hist-histogram-of-tweets__twitter__easy.sql) — two-stage aggregation into a frequency distribution
