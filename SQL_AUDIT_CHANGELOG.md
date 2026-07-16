# SQL Audit and Change Log

This file records the SQL corrections, header cleanup, and pattern-folder reorganization. README creation and editing were intentionally excluded so that documentation can be handled separately.

## Audit summary

- 50 SQL files reviewed.
- `Access` and `Dialect` removed from every solution header.
- Headers rewritten to describe the SQL actually implemented.
- 20 queries retained with header-only changes.
- SQL changed only for correctness, edge cases, clear simplification, or meaningful efficiency.
- All featured SQL files were placed in their canonical pattern folders.
- Misclassified solutions were moved to folders that match the techniques actually used.
- PostgreSQL parsing checks passed for all 50 files.
- Targeted behavioral tests passed for all audited risk cases.
- No README files are included in this package.

## File-by-file SQL review and final location


| Original location | Final location | Audit result | SQL/header change |
|---|---|---|---|
| `01_aggregations_histograms/01_stats-compressed-mean__alibaba__easy.sql` | `01_aggregations_metrics/05_stats-compressed-mean__alibaba__easy.sql` | **Header only** | SQL retained; header now describes the weighted-mean calculation. |
| `01_aggregations_histograms/02_stats-compressed-mode__alibaba__medium.sql` | `01_aggregations_metrics/07_stats-compressed-mode__alibaba__medium.sql` | **Simplified** | Replaced MAX subquery with shorter ORDER BY/LIMIT and deterministic tie-break. |
| `01_aggregations_histograms/03_hist-histogram-users-and-purchases__walmart__medium.sql` | `01_aggregations_metrics/08_hist-users-and-purchases__walmart__medium.sql` | **Header only** | SQL retained; header now describes latest-date ranking plus purchase aggregation. |
| `01_aggregations_histograms/04_rate-international-call-percentage__verizon__medium.sql` | `01_aggregations_metrics/09_rate-international-call-percentage__verizon__medium.sql` | **Corrected** | Original returned two counts, not the required percentage; now calculates and rounds the rate. |
| `01_aggregations_histograms/05_rate-app-click-through-rate__facebook__easy.sql` | `01_aggregations_metrics/04_rate-app-click-through-rate__facebook__easy.sql` | **Optimized** | Uses FILTER counts, NULLIF, and a half-open 2022 date range. |
| `02_joins_antijoins/01_antijoin-page-with-no-likes__facebook__easy.sql` | `02_joins_set_logic/01_antijoin-page-with-no-likes__facebook__easy.sql` | **Header only** | Anti-join SQL retained; wording shortened and aligned. |
| `02_joins_antijoins/02_join-cities-with-completed-trades__robinhood__easy.sql` | `02_joins_set_logic/02_join-cities-with-completed-trades__robinhood__easy.sql` | **Header only** | SQL retained; header corrected from DISTINCT listing to grouped top-three aggregation. |
| `02_joins_antijoins/03_join-unfinished-parts__tesla__easy.sql` | `07_transformations_cleaning/01_clean-unfinished-parts__tesla__easy.sql` | **Header only** | SQL retained; header now states that this is direct NULL filtering, not a join. |
| `02_joins_antijoins/04_join-second-day-confirmation__tiktok__easy.sql` | `05_retention_conversion/01_conversion-second-day-confirmation__tiktok__easy.sql` | **Header only** | SQL retained; header now describes the actual join and one-day date comparison. |
| `02_joins_antijoins/05_join-booking-referral-source__airbnb__medium.sql` | `02_joins_set_logic/04_join-booking-referral-source__airbnb__medium.sql` | **Corrected** | Fixed integer division, removed an unnecessary CTE, and added deterministic first-booking ordering. |
| `02_joins_antijoins/06_join-ibm-db2-product-analytics__ibm__easy.sql` | `02_joins_set_logic/03_join-ibm-db2-product-analytics__ibm__easy.sql` | **Optimized** | Uses a half-open Q3 timestamp range and removes redundant COALESCE around COUNT. |
| `03_window_rank_topn/01_window-sending-vs-opening-snaps__snapchat__medium.sql` | `01_aggregations_metrics/10_rate-sending-vs-opening-snaps__snapchat__medium.sql` | **Header only** | SQL retained; header now identifies conditional aggregation rather than a window pattern. |
| `03_window_rank_topn/02_rank-highest-grossing-items__amazon__medium.sql` | `03_window_functions_ranking/04_rank-highest-grossing-items__amazon__medium.sql` | **Optimized** | Uses a date range, deterministic product tie-break, and <= 2 filter. |
| `03_window_rank_topn/03_logic-supercloud-customer__microsoft__medium.sql` | `08_business_logic_optimization/01_logic-supercloud-customer__microsoft__medium.sql` | **Simplified** | Removed the unnecessary CTE and moved the category-coverage condition into HAVING. |
| `03_window_rank_topn/04_window-odd-and-even-measurements__google__medium.sql` | `03_window_functions_ranking/05_window-odd-and-even-measurements__google__medium.sql` | **Header only** | SQL retained; notes now match row numbering and parity aggregation. |
| `03_window_rank_topn/05_window-user-session-activity__twitter__medium.sql` | `03_window_functions_ranking/06_rank-user-session-activity__twitter__medium.sql` | **Corrected** | Replaced inclusive BETWEEN with an exact January date range. |
| `03_window_rank_topn/06_window-cumulative-purchases-by-product-type__amazon__medium.sql` | `03_window_functions_ranking/07_window-cumulative-purchases-by-product-type__amazon__medium.sql` | **Header only** | SQL retained; header now directly describes the cumulative window. |
| `04_time_series_growth/01_timeseries-average-post-hiatus__facebook__easy.sql` | `04_time_series_growth/01_timeseries-average-post-hiatus__facebook__easy.sql` | **Optimized** | Uses an index-friendly 2021 date range and COUNT(*). |
| `04_time_series_growth/02_timeseries-faang-stock-min-max__bloomberg__medium.sql` | `03_window_functions_ranking/08_rank-faang-stock-min-max__bloomberg__medium.sql` | **Header only** | SQL retained; header now describes separate high/low rankings. |
| `04_time_series_growth/03_timeseries-spotify-streaming-history__spotify__medium.sql` | `04_time_series_growth/02_timeseries-spotify-streaming-history__spotify__medium.sql` | **Optimized** | Uses an unambiguous timestamp boundary and COUNT(*) for weekly plays. |
| `04_time_series_growth/04_timeseries-repeated-payments__stripe__hard.sql` | `04_time_series_growth/04_timeseries-repeated-payments__stripe__hard.sql` | **Simplified** | Compares timestamp intervals directly instead of converting differences to epoch minutes. |
| `04_time_series_growth/05_timeseries-faang-stock-monthly-change__bloomberg__medium.sql` | `04_time_series_growth/03_timeseries-faang-stock-monthly-change__bloomberg__medium.sql` | **Optimized** | Adds numeric percentage arithmetic and NULLIF for zero prior closes. |
| `05_retention_activation/01_retention-advertiser-status__facebook__hard.sql` | `05_retention_conversion/03_retention-advertiser-status__facebook__hard.sql` | **Header only** | SQL retained; concise notes now reflect the full outer join and status transitions. |
| `05_retention_activation/02_retention-patient-support-analysis-part-1__unitedhealth__easy.sql` | `01_aggregations_metrics/06_agg-patient-support-analysis-part-1__unitedhealth__easy.sql` | **Header only** | SQL retained; header now describes aggregation and HAVING. |
| `05_retention_activation/03_retention-patient-support-analysis-part-2__unitedhealth__medium.sql` | `01_aggregations_metrics/11_rate-patient-support-analysis-part-2__unitedhealth__medium.sql` | **Simplified** | Replaced the CTE and scalar subquery with one conditional aggregation scan. |
| `05_retention_activation/04_retention-patient-support-analysis-part-3__unitedhealth__hard.sql` | `04_time_series_growth/05_timeseries-patient-support-analysis-part-3__unitedhealth__hard.sql` | **Simplified** | Compares call intervals directly instead of repeating LAG and converting to days. |
| `05_retention_activation/05_retention-patient-support-analysis-part-4__unitedhealth__hard.sql` | `04_time_series_growth/06_timeseries-patient-support-analysis-part-4__unitedhealth__hard.sql` | **Corrected** | Aggregates by full calendar month and orders LAG chronologically across year boundaries. |
| `06_sessionization_streaks/01_streak-user-shopping-sprees__amazon__medium.sql` | `06_streaks_sequences/01_streak-user-shopping-sprees__amazon__medium.sql` | **Comment cleanup** | SQL approach retained; removed the long tutorial block and kept one concise header note. |
| `06_sessionization_streaks/02_streak-consecutive-filing-years__intuit__hard.sql` | `06_streaks_sequences/02_streak-consecutive-filing-years__intuit__hard.sql` | **Corrected** | Deduplicates user-year pairs and requires an actual three-year sequence. |
| `06_sessionization_streaks/03_streak-same-week-purchases__etsy__hard.sql` | `05_retention_conversion/04_conversion-same-week-purchases__etsy__hard.sql` | **Corrected** | Moved the purchase-date condition into the LEFT JOIN so late-only purchasers stay in the denominator. |
| `07_transformations_cleaning/01_clean-invalid-search-results__google__medium.sql` | `07_transformations_cleaning/03_clean-invalid-search-results__google__medium.sql` | **Comment cleanup** | Weighted calculation retained; removed the long explanatory block and tightened formatting. |
| `07_transformations_cleaning/02_clean-fill-missing-client-data__accenture__medium.sql` | `07_transformations_cleaning/04_clean-fill-missing-client-data__accenture__medium.sql` | **Comment cleanup** | Forward-fill logic retained; removed tutorial text and renamed the grouping alias for clarity. |
| `07_transformations_cleaning/03_transform-email-table-transformation__facebook__medium.sql` | `07_transformations_cleaning/05_transform-email-table-transformation__facebook__medium.sql` | **Header only** | SQL retained; header now identifies conditional aggregation as a pivot. |
| `07_transformations_cleaning/04_stats-compensation-outliers__accenture__medium.sql` | `07_transformations_cleaning/06_transform-compensation-outliers__accenture__medium.sql` | **Optimized** | Computes the title-level average once instead of calculating two separate window expressions. |
| `08_business_logic_mixed/01_optimize-maximize-prime-item-inventory__amazon__hard.sql` | `08_business_logic_optimization/04_optimize-maximize-prime-item-inventory__amazon__hard.sql` | **Header only** | Closed-form SQL retained; notes now correctly describe FLOOR-based allocation, not enumeration. |
| `08_business_logic_mixed/02_logic-3-topping-pizzas__mckinsey__hard.sql` | `08_business_logic_optimization/03_logic-3-topping-pizzas__mckinsey__hard.sql` | **Header only** | SQL retained; notes now describe ordered self-join combinations. |
| `08_business_logic_mixed/03_logic-swapped-food-delivery__zomato__medium.sql` | `08_business_logic_optimization/02_logic-swapped-food-delivery__zomato__medium.sql` | **Header only** | SQL retained; header now describes parity-based row swapping. |
| `08_business_logic_mixed/04_stats-compressed-median__alibaba__hard.sql` | `01_aggregations_metrics/12_stats-compressed-median__alibaba__hard.sql` | **Header only** | SQL retained; notes now match the cumulative-frequency median method. |
| `featured/01_agg-histogram-of-tweets__twitter__easy.sql` | `01_aggregations_metrics/02_hist-histogram-of-tweets__twitter__easy.sql` | **Optimized** | Uses a half-open 2022 date range, COUNT(*), and explicit bucket ordering. |
| `featured/02_agg-laptop-vs-mobile-viewership__ny_times__easy.sql` | `01_aggregations_metrics/01_agg-laptop-vs-mobile-viewership__ny_times__easy.sql` | **Header only** | SQL retained; concise header matches the two conditional counts. |
| `featured/03_agg-teams-power-users__microsoft__easy.sql` | `01_aggregations_metrics/03_agg-teams-power-users__microsoft__easy.sql` | **Optimized** | Uses an exact August date range and COUNT(*). |
| `featured/04_dedupe-duplicate-job-listings__linkedin__easy.sql` | `07_transformations_cleaning/02_dedupe-duplicate-job-listings__linkedin__easy.sql` | **Corrected** | Counts distinct companies so one company with multiple duplicate groups is not overcounted. |
| `featured/05_window-users-third-transaction__uber__medium.sql` | `03_window_functions_ranking/02_window-users-third-transaction__uber__medium.sql` | **Header only** | SQL retained; header now precisely describes ROW_NUMBER and the third row. |
| `featured/06_rank-second-highest-salary__faang__medium.sql` | `03_window_functions_ranking/01_rank-second-highest-salary__faang__medium.sql` | **Comment cleanup** | Original efficient MAX/subquery solution retained and compacted; false DENSE_RANK claims removed. |
| `featured/07_rank-top-three-salaries__faang__medium.sql` | `03_window_functions_ranking/03_rank-top-three-salaries__faang__medium.sql` | **Header only** | SQL retained; DENSE_RANK notes already matched the implementation and were shortened. |
| `featured/08_retention-signup-activation-rate__tiktok__medium.sql` | `05_retention_conversion/02_conversion-signup-activation-rate__tiktok__medium.sql` | **Corrected** | Counts distinct confirmed IDs, protects denominator, and fixes the output alias typo. |
| `featured/09_retention-active-user-retention__facebook__hard.sql` | `05_retention_conversion/05_retention-active-user-retention__facebook__hard.sql` | **Corrected** | Uses exact June and July 2022 ranges so June from another year cannot qualify a user. |
| `featured/10_timeseries-yoy-growth-rate__wayfair__hard.sql` | `04_time_series_growth/07_timeseries-yoy-growth-rate__wayfair__hard.sql` | **Corrected** | Aggregates all transactions to product-year totals before applying LAG. |
| `featured/11_streak-marketing-touch-streak__snowflake__hard.sql` | `06_streaks_sequences/03_streak-marketing-touch-streak__snowflake__hard.sql` | **Corrected** | Requires three distinct consecutive weeks, removes OR/AND precedence bug, and verifies trial_request. |
| `featured/12_stats-median-google-search-frequency__google__hard.sql` | `01_aggregations_metrics/13_stats-median-google-search-frequency__google__hard.sql` | **Simplified** | Keeps the existing expansion-plus-percentile strategy but replaces GROUP BY expansion with idiomatic LATERAL GENERATE_SERIES. |
