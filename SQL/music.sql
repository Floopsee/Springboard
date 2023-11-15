-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  producer_name TEXT NOT NULL
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '1997-04-15', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera'),
  ('One Sweet Day', 282, '1995-11-14', 'Daydream'),
  ('Shallow', 216, '2018-09-27', 'A Star Is Born'),
  ('How You Remind Me', 223, '2001-08-21', 'Silver Side Up'),
  ('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3'),
  ('Dark Horse', 215, '2013-12-17', 'Prism'),
  ('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over'),
  ('Complicated', 244, '2002-05-14', 'Let Go'),
  ('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall');


INSERT INTO artists (song_id, artist_name)
VALUES
  (1, 'Hanson'),
  (2, 'Queen'),
  (3, 'Mariah Carey'),
  (3, 'Boyz II Men'),
  (4, 'Lady Gaga'),
  (4, 'Bradley Cooper'),
  (5, 'Nickelback'),
  (6, 'Jay Z'),
  (6, 'Alicia Keys'),
  (7, 'Katy Perry'),
  (7, 'Juicy J'),
  (8, 'Maroon 5'),
  (8, 'Christina Aguilera'),
  (9, 'Avril Lavigne'),
  (10, 'Destiny''s Child');


INSERT INTO producers (song_id, producer_name)
VALUES
  (1, 'Dust Brothers'),
  (1, 'Stephen Lironi'),
  (2, 'Roy Thomas Baker'),
  (3, 'Walter Afanasieff'),
  (4, 'Benjamin Rice'),
  (5, 'Rick Parashar'),
  (6, 'Al Shux'),
  (7, 'Max Martin'),
  (7, 'Cirkut'),
  (8, 'Shellback'),
  (8, 'Benny Blanco'),
  (9, 'The Matrix'),
  (10, 'Darkchild');