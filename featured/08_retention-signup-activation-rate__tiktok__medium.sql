-- Title: Signup Activation Rate
-- Company: TikTok
-- Difficulty: Medium
-- Access: Free
-- Pattern: conversion rate (conditional aggregation)
-- Summary: Compute activation rate as activated users divided by total signed-up users, rounded to 2 decimals.
-- Notes: Use COUNT(DISTINCT ...) with CASE to count activated users; divide by total distinct users.
-- Dialect: PostgreSQL

SELECT
  ROUND(COUNT(texts.email_id)::DECIMAL/COUNT(DISTINCT emails.email_id),2) 
  AS activitation_rate
FROM emails 
LEFT JOIN texts 
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';