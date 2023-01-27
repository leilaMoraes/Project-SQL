SELECT 
  COUNT(DISTINCT s.songs_id) AS 'cancoes',
  COUNT(DISTINCT ar.artist_id) AS 'artistas',
  COUNT(DISTINCT al.album_id) AS 'albuns'
FROM 
  SpotifyClone.songs s 
INNER JOIN 
  SpotifyClone.artists ar
ON 
  s.artist_id = ar.artist_id
INNER JOIN 
  SpotifyClone.albuns al
ON
  s.album_id = al.album_id;