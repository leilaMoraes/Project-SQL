SELECT 
  songs_name AS 'cancao',
  COUNT(ph.reproduction_date) AS 'reproducoes'
FROM 
  SpotifyClone.songs
INNER JOIN 
  SpotifyClone.play_history ph
ON 
  songs.songs_id = ph.songs_id
GROUP BY songs_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;