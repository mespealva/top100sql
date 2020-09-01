CREATE DATABASE movies;
--\c movies
CREATE TABLE movies(id INT, name_movie VARCHAR(100), release_year INT, director VARCHAR(50), PRIMARY KEY(id));
CREATE TABLE actors(id INT, name_actor VARCHAR(50), FOREIGN KEY (id) REFERENCES movies(id));
--\copy movies FROM 'peliculas.csv' csv header;
--\copy actors FROM 'reparto.csv' csv;

SELECT name_movie, release_year, director, name_actor FROM movies JOIN actors ON movies.id=actors.id WHERE movies.name_movie='Titanic';

SELECT name_movie FROM movies JOIN actors ON movies.id=actors.id WHERE actors.name_actor='Harrison Ford';

SELECT director,count(*) FROM movies GROUP BY director ORDER BY count(*) DESC LIMIT 10; 

SELECT count (DISTINCT name_actor) FROM actors; 
SELECT DISTINCT name_actor FROM actors;

SELECT name_movie, release_year FROM movies WHERE release_year >= 1990 AND release_year <= 1999 ORDER BY name_movie;

SELECT name_actor, name_movie, release_year FROM movies JOIN actors ON movies.id=actors.id WHERE release_year=2001;

SELECT name_actor, name_movie, release_year FROM movies JOIN actors ON movies.id=actors.id WHERE release_year=(SELECT MAX(release_year) FROM movies);
