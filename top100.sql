CREATE DATABASE peliculas;
--\c peliculas
CREATE TABLE pelicula(id INT, pelicula VARCHAR(100), estreno INT, director VARCHAR(50), PRIMARY KEY(id));
CREATE TABLE reparto(id INT, actor VARCHAR(50), FOREIGN KEY (id) REFERENCES pelicula(id));
--\copy pelicula FROM 'peliculas.csv' csv header;
--\copy reparto FROM 'reparto.csv' csv;

SELECT pelicula, estreno, director, actor FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE pelicula.pelicula='Titanic';

SELECT pelicula FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE reparto.actor='Harrison Ford';

SELECT director,count(*) AS numero_peliculas FROM pelicula GROUP BY director ORDER BY count(*) DESC LIMIT 10; 

SELECT count(DISTINCT actor)  AS num_actores_distintos FROM reparto; 
-- SELECT DISTINCT actor FROM reparto;

SELECT pelicula, estreno FROM pelicula WHERE estreno >= 1990 AND estreno <= 1999 ORDER BY pelicula;

SELECT actor, pelicula, estreno FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE estreno=2001;

SELECT actor FROM reparto WHERE id=(SELECT id FROM pelicula ORDER BY estreno DESC LIMIT 1);
