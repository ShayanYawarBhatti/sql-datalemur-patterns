# SQL Patterns (DataLemur Practice: Top 50)

A curated collection of my **top 50 SQL interview-style solutions**, organized by **reusable patterns** (window functions, ranking, retention, sessionization, time-series growth, etc.).

This repo is intentionally structured to be **easy for recruiters and interviewers to scan** and for me to quickly review common query patterns.

> Note: Problem statements are **summarized in my own words**. For premium questions, I do not include prompt text, schemas, or examples—only my summary + SQL.

---

## Table of Contents
- [Featured](#featured)
- [Repo Structure](#repo-structure)
- [Patterns Covered](#patterns-covered)
- [Naming Convention](#naming-convention)
- [How to Read a Solution](#how-to-read-a-solution)
- [Folder Index](#folder-index)
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

## Patterns Covered
- Aggregations & distributions (histograms, compressed stats)
- Joins & anti-joins
- Window functions (rolling averages, lag/lead)
- Ranking (top-N, ties)
- Time-series growth (MoM/YoY logic)
- Retention & activation
- Sessionization & streak detection
- Transformations & data cleaning
- Business logic / multi-step reasoning

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

## Disclaimer
This repository is a personal learning and demonstration artifact.
Problem summaries are written in my own words; solutions reflect my approach and notes.
For premium questions, no prompt text, schemas, or examples are included.
