-- Title: Signup Activation Rate
-- Company: TikTok
-- Difficulty: Medium
-- Pattern: conversion rate + distinct counts
-- Summary: Calculate confirmed signup activations divided by all signups.
-- Notes: Count distinct confirmed email IDs so duplicate confirmation rows cannot inflate the numerator.

SELECT
  ROUND(
    COUNT(DISTINCT texts.email_id)::DECIMAL
    / NULLIF(COUNT(DISTINCT emails.email_id), 0),
    2
  ) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
 AND texts.signup_action = 'Confirmed';
