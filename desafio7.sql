SELECT 
  artist_name AS 'artista',
  a.album_name AS 'album',
  COUNT(fa.artist_id) AS 'seguidores'
FROM 
  SpotifyClone.artists
INNER JOIN 
  SpotifyClone.albuns a
ON 
  artists.artist_id = a.artist_id
INNER JOIN 
  SpotifyClone.following_artists fa
ON 
  artists.artist_id = fa.artist_id
GROUP BY artist_name, album_name
ORDER BY seguidores DESC, artista, album;