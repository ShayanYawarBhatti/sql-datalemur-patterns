-- Title: FAANG Stock Monthly Change (Part 2)
-- Company: Bloomberg
-- Difficulty: Medium
-- Pattern: LAG + percentage change
-- Summary: Calculate each ticker's change from its previous recorded close.
-- Notes: Use LAG by ticker and protect the percentage calculation from division by zero.

WITH intermonth_prices AS (
  SELECT
    ticker,
    date,
    close,
    LAG(close) OVER (
      PARTITION BY ticker
      ORDER BY date
    ) AS prev_close
  FROM stock_prices
)

SELECT
  ticker,
  date,
  close,
  ROUND(100.0 * (close - prev_close) / NULLIF(prev_close, 0), 2) AS intermth_change_pct
FROM intermonth_prices
ORDER BY ticker, date;
