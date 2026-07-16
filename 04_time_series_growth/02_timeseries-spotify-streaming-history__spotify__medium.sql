-- Title: Spotify Streaming History
-- Company: Spotify
-- Difficulty: Medium
-- Pattern: UNION ALL + aggregation
-- Summary: Combine historical and recent plays into lifetime counts per user and song.
-- Notes: UNION ALL preserves counts; aggregate after combining both sources.

WITH history AS (
  SELECT
    user_id,
    song_id,
    song_plays
  FROM songs_history

  UNION ALL

  SELECT
    user_id,
    song_id,
    COUNT(*) AS song_plays
  FROM songs_weekly
  WHERE listen_time < TIMESTAMP '2022-08-05'
  GROUP BY user_id, song_id
)

SELECT
  user_id,
  song_id,
  SUM(song_plays) AS song_count
FROM history
GROUP BY user_id, song_id
ORDER BY song_count DESC;
