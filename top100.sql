--1. Crear base de datos llamada películas
CREATE DATABASE peliculas;
--\c peliculas
--2. Revisar los archivos peliculas.csv y reparto.csv 
CREATE TABLE pelicula(id INT, pelicula VARCHAR(100), estreno INT, director VARCHAR(50), PRIMARY KEY(id));
CREATE TABLE reparto(id INT, actor VARCHAR(50), FOREIGN KEY (id) REFERENCES pelicula(id));
--3. Cargar ambos archivos a su tabla correspondiente
--\copy pelicula FROM 'peliculas.csv' csv header;
--\copy reparto FROM 'reparto.csv' csv;

--Listar todos los actores que aparecen en la película "Titanic"
SELECT pelicula, estreno, director, actor FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE pelicula.pelicula='Titanic';
--5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE reparto.actor='Harrison Ford';
--6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el
top 100
SELECT director,count(*) AS numero_peliculas FROM pelicula GROUP BY director ORDER BY count(*) DESC LIMIT 10; 
--7. Indicar cuantos actores distintos hay
SELECT count(DISTINCT actor)  AS num_actores_distintos FROM reparto; 
-- SELECT DISTINCT actor FROM reparto;
--8. Indicar las películas estrenadas entre los años 1990 y 1999
SELECT pelicula, estreno FROM pelicula WHERE estreno >= 1990 AND estreno <= 1999 ORDER BY pelicula;
--9. Listar el reparto de las películas lanzadas el año 2001
SELECT actor, pelicula, estreno FROM pelicula JOIN reparto ON pelicula.id=reparto.id WHERE estreno=2001;
--10. Listar los actores de la película más nueva
SELECT actor FROM reparto WHERE id=(SELECT id FROM pelicula ORDER BY estreno DESC LIMIT 1);
