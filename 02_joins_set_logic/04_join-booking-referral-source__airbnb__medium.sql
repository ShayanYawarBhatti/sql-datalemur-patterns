-- Title: Booking Referral Source
-- Company: Airbnb
-- Difficulty: Medium
-- Pattern: window ranking + attribution aggregation
-- Summary: Find the leading channel among users' first bookings and its percentage.
-- Notes: Rank bookings per user, keep the first, aggregate by channel, then divide by all first bookings.

WITH booking_history AS (
  SELECT
    b.user_id,
    ba.channel,
    ROW_NUMBER() OVER (
      PARTITION BY b.user_id
      ORDER BY b.booking_date, b.booking_id
    ) AS booking_num
  FROM bookings AS b
  INNER JOIN booking_attribution AS ba
    ON b.booking_id = ba.booking_id
)

SELECT
  channel,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 0) AS first_booking_pct
FROM booking_history
WHERE booking_num = 1
GROUP BY channel
ORDER BY first_booking_pct DESC, channel
LIMIT 1;
