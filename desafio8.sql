SELECT 
  artist_name AS 'artista',
  a.album_name AS 'album'
FROM 
  SpotifyClone.artists
INNER JOIN 
  SpotifyClone.albuns a
ON 
  artists.artist_id = a.artist_id
WHERE artist_name = 'Elis Regina'
ORDER BY album;