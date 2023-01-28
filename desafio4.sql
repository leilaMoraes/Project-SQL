SELECT 
  user_name AS 'usuario',
  IF(YEAR(MAX(ph.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM 
  SpotifyClone.users 
INNER JOIN 
  SpotifyClone.play_history ph
ON 
  users.user_id = ph.user_id
GROUP BY user_name
ORDER BY user_name;