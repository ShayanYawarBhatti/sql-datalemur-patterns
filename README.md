## Author
Shayan Yawar Bhatti — Data Analyst @ IntelliLight AI  
LinkedIn: https://www.linkedin.com/in/shayan-yawar-bhatti/  
GitHub: https://github.com/ShayanYawarBhatti

# SQL Patterns (DataLemur Practice: Top 50)

A curated collection of my **top 50 SQL interview-style solutions**, organized by **reusable patterns** (window functions, ranking, retention, sessionization, time-series growth, etc.).

This repo is intentionally structured to be **easy for recruiters and interviewers to scan** and for me to quickly review common query patterns.

> Note: Problem statements are **summarized in my own words**. For premium questions, I do not include prompt text, schemas, or examples—only my summary + SQL.

---

## Table of Contents
- [Featured Solutions](#featured)
- [Repository Structure](#repo-structure)
- [Folder Index](#folder-index)
- [SQL Skills Demonstrated](#what-this-demonstrates-sql-skills)
- [Advanced Concepts Covered](#advanced-sql-concepts-covered)
- [How to Use This Repo](#how-to-use-this-repo)
- [Naming Convention](#naming-convention)
- [How to Read a Solution](#how-to-read-a-solution)
- [Disclaimer](#disclaimer)

---

## Featured

If you only review a few, start here:

1. [Histogram of Tweets (Twitter — Easy)](./featured/01_agg-histogram-of-tweets__twitter__easy.sql)
2. [Laptop vs. Mobile Viewership (NY Times — Easy)](./featured/02_agg-laptop-vs-mobile-viewership__ny_times__easy.sql)
3. [Teams Power Users (Microsoft — Easy)](./featured/03_agg-teams-power-users__microsoft__easy.sql)
4. [Duplicate Job Listings (LinkedIn — Easy)](./featured/04_dedupe-duplicate-job-listings__linkedin__easy.sql)
5. [User's Third Transaction (Uber — Medium)](./featured/05_window-users-third-transaction__uber__medium.sql)
6. [Second Highest Salary (FAANG — Medium)](./featured/06_rank-second-highest-salary__faang__medium.sql)
7. [Top Three Salaries (FAANG — Medium)](./featured/07_rank-top-three-salaries__faang__medium.sql)
8. [Signup Activation Rate (TikTok — Medium)](./featured/08_retention-signup-activation-rate__tiktok__medium.sql)
9. [Active User Retention (Facebook — Hard)](./featured/09_retention-active-user-retention__facebook__hard.sql)
10. [Y-on-Y Growth Rate (Wayfair — Hard)](./featured/10_timeseries-yoy-growth-rate__wayfair__hard.sql)
11. [Marketing Touch Streak (Snowflake — Hard)](./featured/11_streak-marketing-touch-streak__snowflake__hard.sql)
12. [Median Google Search Frequency (Google — Hard)](./featured/12_stats-median-google-search-frequency__google__hard.sql)

➡️ See: [`/featured`](./featured)

---

## Repo Structure
Solutions are organized by SQL pattern:

- `featured/` — top representative problems
- `01_aggregations_histograms/`
- `02_joins_antijoins/`
- `03_window_rank_topn/`
- `04_time_series_growth/`
- `05_retention_activation/`
- `06_sessionization_streaks/`
- `07_transformations_cleaning/`
- `08_business_logic_mixed/`

---

## Folder Index
- Aggregations & Histograms: [`01_aggregations_histograms`](./01_aggregations_histograms)
- Joins & Anti-joins: [`02_joins_antijoins`](./02_joins_antijoins)
- Window + Rank + Top-N: [`03_window_rank_topn`](./03_window_rank_topn)
- Time-Series & Growth: [`04_time_series_growth`](./04_time_series_growth)
- Retention & Activation: [`05_retention_activation`](./05_retention_activation)
- Sessionization & Streaks: [`06_sessionization_streaks`](./06_sessionization_streaks)
- Transformations & Cleaning: [`07_transformations_cleaning`](./07_transformations_cleaning)
- Business Logic (Hard / Mixed): [`08_business_logic_mixed`](./08_business_logic_mixed)

---

## What this demonstrates (SQL skills)

Across these solutions, I repeatedly practiced:

### Query fundamentals
- `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`
- conditional logic with `CASE WHEN`
- correct handling of `NULL`s, duplicates, and edge cases

### Aggregations & analytics
- conditional aggregation (`COUNT(*) FILTER`, `SUM(CASE WHEN ...)`)
- percent/rate metrics, weighted averages
- cohort-style metrics and retention calculations

### Joins (including tricky interview patterns)
- `INNER`, `LEFT`, `ANTI-JOIN` patterns (`LEFT JOIN ... WHERE right IS NULL`)
- de-duplication before joining (CTEs / window ranks)

### Window functions
- `ROW_NUMBER`, `RANK`, `DENSE_RANK`
- running totals, rolling averages, moving windows
- “top-N per group” and “latest row per user” patterns

### Time-series & growth
- period-over-period comparisons (WoW / MoM / YoY)
- `LAG/LEAD`-based deltas, alignment by date/month

### Hard patterns
- sessionization / streaks (consecutive-day logic)
- “sweep line” concurrency (start/end events + running sum)
- multi-CTE pipelines with intermediate validation

---

## Advanced SQL concepts covered

- **Window frames:** rolling averages / moving windows (`ROWS BETWEEN ...`)
- **Ranking & tie logic:** `ROW_NUMBER` vs `RANK` vs `DENSE_RANK`
- **Top-N per group:** keep top rows per partition (with or without ties)
- **Retention/cohorts:** activation + returning-user metrics
- **Sessionization & streaks:** consecutive-day and session boundary logic
- **Concurrency:** sweep-line technique (start/+1, end/-1 → running sum)
- **Multi-step transformations:** CTE pipelines with intermediate validation
- **Anti-joins:** find entities with “no match” using `LEFT JOIN ... IS NULL`
- **Time-series comparisons:** `LAG/LEAD`, YoY/WoW deltas, month alignment
- **Data correctness:** null handling, de-duplication, numeric casting to avoid integer division

---

## How to use this repo

### If you're a recruiter / interviewer
Start here:
1. **Featured** for the fastest scan
2. `03_window_rank_topn/` for window/ranking depth
3. `05_retention_activation/` and `06_sessionization_streaks/` for advanced analytics patterns
4. `08_business_logic_mixed/` for harder multi-step reasoning

Each solution file includes:
- a short summary in my own words
- problem metadata (company, difficulty, access)
- my SQL solution

### If you're me (review workflow)
- I review by folder/pattern using each folder’s index file.
- I search keywords across the repo:
  - `rank`, `dense_rank`, `row_number`
  - `anti join`, `left join`, `is null`
  - `lag`, `lead`, `rolling`, `yoy`, `retention`, `streak`, `session`

---

## Naming Convention
All solution files follow:

`{NN}_{pattern}-{short-title}__{company}__{difficulty}.sql`

Example:
- `03_window-tweets-rolling-averages__twitter__medium.sql`

Pattern tags:
- `agg`, `join`, `window`, `rank`, `time`, `retention`, `session`, `transform`, `logic`

---

## How to Read a Solution
Each `.sql` starts with a short header:

- Title / Company / Difficulty
- Access: Premium (if applicable)
- Pattern tag
- Summary (written in my own words)
- Notes (edge cases / approach)

---

## Disclaimer
This repository is for personal learning and interview preparation.  
All problem statements, schemas, sample data, and platform content belong to their respective owners (e.g., DataLemur). I do **not** reproduce prompt text, schemas, examples, or test cases—only my own summaries and original SQL solutions.
