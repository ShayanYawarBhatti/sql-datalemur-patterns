-- Title: Repeated Payments
-- Company: Stripe
-- Difficulty: Hard
-- Pattern: LAG + interval comparison
-- Summary: Count repeated payments occurring within ten minutes of a matching prior payment.
-- Notes: Compare each timestamp with the previous transaction sharing merchant, card, and amount.

WITH payments AS (
  SELECT
    transaction_timestamp - LAG(transaction_timestamp) OVER (
      PARTITION BY merchant_id, credit_card_id, amount
      ORDER BY transaction_timestamp
    ) AS time_since_previous
  FROM transactions
)

SELECT COUNT(*) AS payment_count
FROM payments
WHERE time_since_previous <= INTERVAL '10 minutes';
