SELECT
  songs_name AS 'nome',
  COUNT(ph.user_id) AS 'reproducoes'
FROM 
  SpotifyClone.songs
INNER JOIN 
  SpotifyClone.play_history ph
ON
  songs.songs_id = ph.songs_id
INNER JOIN 
  SpotifyClone.users u
ON 
  ph.user_id = u.user_id
WHERE u.plan_id IN (1, 4)
GROUP BY songs_name
ORDER BY songs_name;