-- Title: Repeated Payments
-- Company: Stripe
-- Difficulty: Hard
-- Access: Free
-- Pattern: time series + dedupe / window (repeat detection)
-- Summary: Detect repeated payments (e.g., same merchant/amount) within a time window by ordering transactions and comparing to prior events.
-- Notes: Often solved with LAG to compare current vs previous payment attributes; apply time-diff condition and filter repeats.
-- Dialect: PostgreSQL

WITH payments AS (
  SELECT 
    merchant_id, 
    EXTRACT(EPOCH FROM transaction_timestamp - 
      LAG(transaction_timestamp) OVER(
        PARTITION BY merchant_id, credit_card_id, amount 
        ORDER BY transaction_timestamp)
    )/60 AS minute_difference 
  FROM transactions) 

SELECT COUNT(merchant_id) AS payment_count
FROM payments 
WHERE minute_difference <= 10;