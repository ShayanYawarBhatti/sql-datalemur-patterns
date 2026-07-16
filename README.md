# SQL Patterns: From Raw Data to Business Decisions

> **Between raw tables and business decisions lies a layer of logic. This repository is about mastering that layer.**

**PostgreSQL · 50 solutions · 8 analytical pattern families · 29 company tags**

[Portfolio Overview](#portfolio-overview) · [Core Patterns](#core-sql-patterns) · [Selected Work](#selected-work) · [Analytical Standards](#analytical-standards) · [Repository Map](#repository-map)

---

## The Analytical Layer

A business question rarely arrives in the shape of a query. It arrives as a request: identify the most valuable customers, measure retention, explain a change in performance, or find the behavior that signals conversion.

Between that request and the final answer, the analyst must make the decisions the data cannot make on its own. Which records belong together? What level should be measured? Which time periods are truly comparable? When should a customer count once, and when should every event count? What does the absence of a row actually mean?

SQL is where those decisions become executable.

---

## Portfolio Overview

| | |
|---|---|
| **Solutions** | 50 |
| **SQL dialect** | PostgreSQL |
| **Analytical families** | 8 pattern-based folders |
| **Difficulty range** | 13 Easy · 24 Medium · 13 Hard |
| **Company tags** | 29 |
| **Primary focus** | Metrics, joins, ranking, time series, retention, sequences, data preparation, and business logic |
| **Review path** | Curated links in [`featured`](./featured) |

The repository is structured as a pattern library rather than a chronological list of completed exercises. That organization makes the work easier to review and, more importantly, reflects how SQL is used in practice: different business questions often reduce to the same underlying analytical shape.

---

## From Question to Decision

A reliable analysis moves through a sequence of decisions:

**Ask → Prepare → Process → Analyze → Share → Act**

This repository concentrates on the three middle stages that form the analytical foundation of everything downstream.

| Stage | What it requires | How it appears here |
|---|---|---|
| **Prepare** | Define scope, grain, time boundaries, keys, populations, and exclusions | Date filters, join conditions, cohort definitions, entity-level grouping |
| **Process** | Clean and reshape records so they can be analyzed consistently | Deduplication, null handling, pivots, aggregation, normalization |
| **Analyze** | Apply the correct metric, comparison, ranking, sequence, or business rule | Rates, windows, growth calculations, retention logic, streak detection |

A final KPI may be a single number, but the quality of that number depends on the decisions made before the calculation. SQL is the layer where those decisions are encoded and where analytical intent becomes executable logic.

---

## Pattern-Based Problem Solving

Business problems rarely announce which SQL technique they require. They arrive in domain language:

- Which products lead each category?
- How many customers returned the following month?
- What percentage of signups converted within a defined window?
- Which users performed an action across consecutive periods?
- How has spend changed year over year?

The skill is recognizing the structure underneath the wording.

A “third transaction,” a “top-selling product,” and a “highest salary by department” all rely on ordering rows within a group and selecting by position. Retention, activation, and repeat behavior all depend on defining populations and testing whether qualifying activity exists in a later period. Consecutive days, weeks, and years are variations of the same sequence problem once the data is normalized to the correct time grain.

Organizing solutions by pattern turns individual questions into reusable analytical knowledge. Instead of memorizing 50 separate answers, the repository shows how a smaller set of techniques can be applied across industries, datasets, and business contexts.

---

## Core SQL Patterns

| Pattern family | Questions it answers | Techniques demonstrated |
|---|---|---|
| **[Metrics & Aggregation](./01_aggregations_metrics)** | How much happened? What share qualifies? How is activity distributed? | Conditional aggregation, rate metrics, histograms, weighted statistics, distinct-value comparisons |
| **[Joins & Set Logic](./02_joins_set_logic)** | What matches, what is missing, and which rows must remain? | Inner and outer joins, anti-joins, set comparison, attribution, preservation of unmatched entities |
| **[Window Functions & Ranking](./03_window_functions_ranking)** | Which row is first, third, or top-N within a group? How does each row compare with its peers? | `ROW_NUMBER`, `RANK`, `DENSE_RANK`, partitioned ordering, running totals |
| **[Time Series & Growth](./04_time_series_growth)** | How did a metric change over time, and what is the correct comparison period? | `LAG`, `LEAD`, monthly and yearly aggregation, growth rates, interval logic |
| **[Retention & Conversion](./05_retention_conversion)** | Did users return, activate, convert, or transition between states? | Cohort logic, conversion windows, retained-user checks, status transitions, denominator control |
| **[Streaks & Sequences](./06_streaks_sequences)** | Did behavior occur across consecutive days, weeks, or years? | Date normalization, deduplication, sequence matching, consecutive-period logic |
| **[Transformation & Data Quality](./07_transformations_cleaning)** | Can the data be trusted and shaped for analysis? | Deduplication, missing-value handling, pivots, validation rules, outlier classification |
| **[Business Logic & Optimization](./08_business_logic_optimization)** | How can an unusual operational rule be expressed clearly and efficiently? | Relational division, combinatorics, allocation logic, ordered transformations, closed-form calculations |

Each folder represents a family of reasoning, not merely a SQL feature. Some solutions use more than one technique, but they are placed according to the primary analytical pattern that determines the answer.

---

## Selected Work

The [`featured`](./featured) directory provides a focused review path without duplicating SQL files. Each entry links to the canonical solution in its pattern folder.

- **[Year-over-Year Growth Rate](./04_time_series_growth/07_timeseries-yoy-growth-rate__wayfair__hard.sql)** — establishes one row per product-year before comparing annual performance.
- **[Active User Retention](./05_retention_conversion/05_retention-active-user-retention__facebook__hard.sql)** — combines exact calendar boundaries, cohort logic, and user-level counting.
- **[Marketing Touch Streak](./06_streaks_sequences/03_streak-marketing-touch-streak__snowflake__hard.sql)** — identifies sustained behavior across consecutive weeks.
- **[Median Google Search Frequency](./01_aggregations_metrics/13_stats-median-google-search-frequency__google__hard.sql)** — calculates a median from compressed frequency data.
- **[Top Three Salaries](./03_window_functions_ranking/02_rank-top-three-salaries__faang__medium.sql)** — applies ranking with tie-aware salary positions inside departments.
- **[Signup Activation Rate](./05_retention_conversion/02_conversion-signup-activation-rate__tiktok__medium.sql)** — constructs a conversion metric while protecting the intended signup population.
- **[Duplicate Job Listings](./07_transformations_cleaning/02_dedupe-duplicate-job-listings__linkedin__easy.sql)** — converts row-level duplication into a company-level data-quality measure.
- **[Maximize Prime Item Inventory](./08_business_logic_optimization/04_optimize-maximize-prime-item-inventory__amazon__hard.sql)** — translates a constrained allocation rule into concise mathematical SQL.

Together, these solutions demonstrate metric design, customer analytics, time-based comparison, ranking, weighted statistics, data quality, sequence detection, and operational business logic.

---

## Solution Design

Every SQL file follows the same compact structure: **Title, Company, Difficulty, Pattern, Summary, and Notes**, followed immediately by the query.

The header provides enough context to understand the analytical objective without reproducing the original problem statement. The `Pattern`, `Summary`, and `Notes` fields are written to match the implementation beneath them, keeping the documentation grounded in the actual SQL.

Files use the naming convention `NN_pattern-title__company__difficulty.sql`, making the repository easy to scan by technique, company, and complexity. Each solution has one canonical location; the featured review path links to those files rather than maintaining duplicate copies.

---

## Analytical Standards

The collection is guided by a consistent set of principles:

- **Define the business meaning before writing the syntax.** A correct query starts with a precise interpretation of the question.
- **Establish the grain before calculating.** Aggregate to the appropriate entity and time level before ranking, comparing periods, or computing growth.
- **Protect the intended population.** Join type and filter placement should preserve the correct numerator, denominator, and unmatched records.
- **Treat time explicitly.** Calendar boundaries, intervals, and sequence rules should reflect the business definition rather than rely on accidental row order.
- **Handle duplicates and ties deliberately.** Repeated events, distinct entities, and equal values can materially change the result.
- **Prefer the simplest dependable solution.** Complexity is added only when it improves correctness, clarity, or efficiency.
- **Write for reviewability.** CTEs, descriptive aliases, and focused comments separate logical stages without narrating obvious syntax.

These standards extend beyond interview practice. They are the same foundations used to build reliable KPIs, customer metrics, operational reporting, and business intelligence.

---

## Skills Demonstrated

| Analytical area | Evidence across the repository |
|---|---|
| **Metric design** | Rates, percentages, weighted statistics, distributions, and distinct-entity counts |
| **Customer analytics** | Activation, conversion, retention, repeat behavior, and lifecycle-state analysis |
| **Ranking and segmentation** | Top-N analysis, nth-event selection, departmental ranking, and tie handling |
| **Time-series analysis** | Month-over-month movement, year-over-year growth, period alignment, and interval comparison |
| **Behavioral analysis** | Consecutive-day, week, and year sequences; repeated-payment and session patterns |
| **Data preparation** | Deduplication, missing-value treatment, reshaping, validation, and outlier classification |
| **Advanced business logic** | Relational division, constrained allocation, combinatorial joins, and ordered transformations |
| **SQL craftsmanship** | Readable PostgreSQL, purposeful CTEs, clear aliases, and pattern-aligned documentation |

The broader capability demonstrated here is the ability to convert an ambiguous analytical request into a structured, explainable, and reusable SQL solution.

---

## Repository Map

- **Start with the strongest examples:** [`featured`](./featured)
- **Metrics and statistical summaries:** [`01_aggregations_metrics`](./01_aggregations_metrics)
- **Matching and missing-data logic:** [`02_joins_set_logic`](./02_joins_set_logic)
- **Ranking and row-level comparison:** [`03_window_functions_ranking`](./03_window_functions_ranking)
- **Growth and period-over-period analysis:** [`04_time_series_growth`](./04_time_series_growth)
- **Customer retention and conversion:** [`05_retention_conversion`](./05_retention_conversion)
- **Behavioral sequences:** [`06_streaks_sequences`](./06_streaks_sequences)
- **Data preparation and quality:** [`07_transformations_cleaning`](./07_transformations_cleaning)
- **Complex operational rules:** [`08_business_logic_optimization`](./08_business_logic_optimization)

---

## Source & Attribution

Problems are sourced from **DataLemur’s SQL interview question set**. Titles and summaries are written in my own words; original prompts, schemas, sample data, and platform test cases are not reproduced. Platform content belongs to its respective owners. The SQL solutions, documentation, and repository organization are my own work.

---

## About

**Shayan Yawar Bhatti** — Data Analyst @ IntelliLight AI

[LinkedIn](https://www.linkedin.com/in/shayan-yawar-bhatti/) · [GitHub](https://github.com/ShayanYawarBhatti)
