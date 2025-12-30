-- Title: FAANG Stock Monthly Change (Part 2)
-- Company: Bloomberg
-- Difficulty: Medium
-- Access: Premium
-- Pattern: time series + LAG (month-over-month change)
-- Summary: Compute month-over-month stock price changes by aggregating to monthly level and using LAG to compare to the prior month.
-- Notes: DATE_TRUNC to month; LAG(month_price) over (ticker order by month); handle first month (NULL) and divide-by-zero with NULLIF.
-- Dialect: PostgreSQL

WITH intermonth_prices AS (SELECT 
  ticker, 
  date,
  close, 
  LAG(close) OVER(
  PARTITION BY ticker 
  ORDER BY date) AS prev_close
FROM stock_prices
ORDER BY ticker, date)

SELECT 
  ticker,
  date,
  close,
  ROUND((100 * (close - prev_close) / prev_close), 2) AS intermth_change_pct
FROM intermonth_prices
ORDER BY ticker, date;
