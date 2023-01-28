SELECT
  COUNT(reproduction_date) AS 'quantidade_musicas_no_historico'
FROM 
  SpotifyClone.play_history ph
INNER JOIN 
  SpotifyClone.users u
ON 
  ph.user_id = u.user_id
WHERE user_name = 'Barbara Liskov';