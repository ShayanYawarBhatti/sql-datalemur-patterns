-- Title: Booking Referral Source
-- Company: Airbnb
-- Difficulty: Medium
-- Access: Premium
-- Pattern: joins + attribution logic
-- Summary: Attribute each booking to its referral source by joining bookings to referral/traffic tables and selecting the relevant source per booking.
-- Notes: Ensure correct join keys (user/session/booking). If multiple touches exist, apply the intended rule (e.g., last touch before booking).
-- Dialect: PostgreSQL

WITH booking_history AS (
SELECT 
  b.user_id,
  b.booking_id,
  ba.channel,
  ROW_NUMBER() OVER(
  PARTITION BY b.user_id 
  ORDER BY b.booking_date) AS booking_num 
FROM bookings AS b
INNER JOIN booking_attribution AS ba
  ON b.booking_id = ba.booking_id
),
channel_first_booking AS (SELECT
  channel,
  COUNT(*) AS channel_booking_num
FROM booking_history
WHERE booking_num = 1
GROUP BY channel
)

SELECT
    channel,
    ROUND(100.0 * (channel_booking_num/
    (SELECT SUM(channel_booking_num) FROM channel_first_booking))
    , 0) AS first_booking_pct
FROM channel_first_booking
ORDER BY first_booking_pct DESC
LIMIT 1;
