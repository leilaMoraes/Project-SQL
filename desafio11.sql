SELECT
  songs_name AS 'nome_musica',
  REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
    songs_name, 'Bard', 'QA'),
    'Amar', 'Code Review'),
    'Pais', 'Pull Requests'),
    'SOUL', 'CODE'),
    'SUPERSTAR', 'SUPERDEV')
  AS 'novo_nome'
FROM 
  SpotifyClone.songs
WHERE songs_name IN ('The Bard’s Song', 'O Medo de Amar é o Medo de Ser Livre', 'Como Nossos Pais', 'BREAK MY SOUL', 'ALIEN SUPERSTAR')
ORDER BY songs_name DESC;