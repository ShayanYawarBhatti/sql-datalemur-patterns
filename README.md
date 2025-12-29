# SQL Patterns (DataLemur Practice)

A curated collection of **50 SQL interview-style solutions**, organized by **reusable patterns** (window functions, ranking, retention, sessionization, time-series growth, etc.).

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
If you only review a few, start here (most representative of common interview patterns):

1. Active User Retention (Facebook) — Hard  
2. Y-on-Y Growth Rate (Wayfair) — Hard  
3. Advertiser Status (Facebook) — Hard  
4. Consecutive Filing Years (Intuit) — Hard  
5. Marketing Touch Streak (Snowflake) — Hard  
6. Repeated Payments (Stripe) — Hard  
7. Median Google Search Frequency (Google) — Hard  
8. Tweets' Rolling Averages (Twitter) — Medium  
9. User's Third Transaction (Uber) — Medium  
10. User Shopping Sprees (Amazon) — Medium  
11. Second Highest Salary (FAANG) — Medium  
12. Top Three Salaries (FAANG) — Medium  

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
