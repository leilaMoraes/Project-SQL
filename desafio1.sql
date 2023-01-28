DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(50) NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      songs_id INT PRIMARY KEY AUTO_INCREMENT,
      songs_name VARCHAR(50) NOT NULL,
      duration_seconds INT NOT NULL,
      release_year INT NOT NULL,
      artist_id INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
      FOREIGN KEY (album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_type VARCHAR(50) NOT NULL,
      plan_value DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(50) NOT NULL,
      user_age INT NOT NULL,
      plan_id INT NOT NULL,
      signature_date DATE NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following_artists(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id),
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.play_history(
      user_id INT NOT NULL,
      songs_id INT NOT NULL,
      reproduction_date DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, songs_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id),
      FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (album_name, artist_id)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);

  INSERT INTO SpotifyClone.songs (songs_name, duration_seconds, release_year, artist_id, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 2022, 1, 1),
    ('VIRGO’S GROOVE', 369, 2022, 1, 1),
    ('ALIEN SUPERSTAR', 116, 2022, 1, 1),
    ('Don’t Stop Me Now', 203, 1978, 2, 2),
    ('Under Pressure', 152, 1982, 2, 3),
    ('Como Nossos Pais', 105, 1998, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 3, 5),
    ('Samba em Paris', 267, 2003, 4, 6),
    ('The Bard’s Song', 244, 2007, 5, 7),
    ('Feeling Good', 100, 2012, 6, 8);
  
  INSERT INTO SpotifyClone.plans (plan_type, plan_value)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.users (user_name, user_age, plan_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, DATE('2019-10-20')),
    ('Robert Cecil Martin', 58, 1, DATE('2017-01-06')),
    ('Ada Lovelace', 37, 2, DATE('2017-12-30')),
    ('Martin Fowler', 46, 2, DATE('2017-01-17')),
    ('Sandi Metz', 58, 2, DATE('2018-04-29')),
    ('Paulo Freire', 19, 3, DATE('2018-02-14')),
    ('Bell Hooks', 26, 3, DATE('2018-01-05')),
    ('Christopher Alexander', 85, 4, DATE('2019-06-05')),
    ('Judith Butler', 45, 4, DATE('2020-05-13')),
    ('Jorge Amado', 58, 4, DATE('2017-02-17'));
  
  INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
  VALUES
    (1, 5),
    (2, 4),
    (4, 1),
    (5, 6),
    (5, 1),
    (6, 1),
    (6, 2),
    (7, 3),
    (8, 5),
    (9, 4),
    (9, 6),
    (10, 4),
    (10, 5),
    (10, 6);
  
  INSERT INTO SpotifyClone.play_history (user_id, songs_id, reproduction_date)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');