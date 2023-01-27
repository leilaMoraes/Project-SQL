SELECT 
  user_name AS 'usuario',
  COUNT(ph.songs_id) AS 'qt_de_musicas_ouvidas',
  SUM(ROUND((s.duration_seconds / 60), 2)) AS 'total_minutos'
FROM 
  SpotifyClone.users 
INNER JOIN 
  SpotifyClone.play_history ph
ON 
  users.user_id = ph.user_id
INNER JOIN 
  SpotifyClone.songs s
ON
  s.songs_id = ph.songs_id
GROUP BY user_name
ORDER BY user_name;