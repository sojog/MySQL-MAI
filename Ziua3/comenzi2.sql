

USE sakila;


SELECT * FROM actor;

INSERT INTO actor SET first_name = "Tom", last_name = "Cruise";
SELECT * FROM actor;

INSERT INTO actor SET first_name = "Angelina", last_name = "Jolie";
INSERT INTO actor SET first_name = "Brad", last_name = "Pitt";
INSERT INTO actor SET first_name = "Leonardo", last_name = "DiCaprio";
SELECT * FROM actor;

SELECT * FROM actor_info;


CREATE VIEW nume_actori 
	AS
		SELECT CONCAT(first_name, " ", last_name) AS full_name FROM actor;

SELECT * FROM nume_actori;
DROP VIEW nume_actori;


CREATE USER sakila_viewer@'%' IDENTIFIED BY 'parola';
GRANT SELECT ON sakila.nume_actori TO sakila_viewer@'%';


SELECT * FROM film;

INSERT INTO language SET name = "English";

SELECT * FROM language;

INSERT INTO film SET title = "Once Upon a Time... in Hollywood",
	language_id = 8;

SELECT * FROM film;


GRANT ALL PRIVILEGES ON sakila.* TO root@'localhost';

CREATE USER 'paul'@'localhost' IDENTIFIED BY "parola";

SELECT * FROM actor;

INSERT INTO film_actor (actor_id, film_id) 
	VALUES (205, 1005), (206, 1005);

SELECT * FROM film_actor;
TRUNCATE film_actor;

SELECT * FROM film_actor;

## Definirea unei variabile
SET @nume = "Mihai";
SELECT @nume;

## Folosirea unei variabile
SELECT @variabila_non_existenta;

SET @@sql_safe_updates = 1;

SELECT @x = 10;

SELECT @x := 10;

SET @x := 11;
SELECT @x;

SET @x = 12;
SELECT @x;

SELECT * FROM film_actor;

SELECT * FROM film;
SET @film_once =  (SELECT film_id FROM film WHERE title LIKE "Once%");
SELECT @film_once;

SET @actor_brad = (SELECT actor_id FROM actor 
	WHERE first_name = "Brad" );

SELECT @actor_leo := (SELECT actor_id FROM actor 
	WHERE first_name = "Leonardo" );

INSERT INTO film_actor (actor_id, film_id ) VALUES (@actor_brad, @film_once),
	(@actor_leo, @film_once);

SELECT * FROM film_actor;

SELECT first_name, last_name, "test" INTO @var1, @var2, @var FROM actor LIMIT 1; 

SELECT @var1;

SELECT @salut :=  "hello";

SET @salut :=  "buna ziua";
SELECT @salut;

SET @salut =  "buna seara";
SELECT @salut;

CREATE VIEW filme_actori_view AS
	(SELECT film.film_id, title, first_name, last_name FROM film 
			 JOIN film_actor
			 ON film.film_id = film_actor.film_id
			 JOIN actor
			 ON actor.actor_id = film_actor.actor_id);

SELECT * FROM filme_actori_view;

SELECT * FROM filme_actori_view WHERE first_name = "Brad";    
    
SELECT film.film_id, title, first_name, last_name FROM film 
			 JOIN film_actor
			 ON film.film_id = film_actor.film_id
			 JOIN actor WHERE first_name = "Brad";

SELECT film.film_id, title, first_name, last_name FROM film 
			 JOIN film_actor
			 ON film.film_id = film_actor.film_id
			 JOIN actor
             ON actor.actor_id = film_actor.actor_id;


SELECT * FROM film 
	JOIN film_actor 
    ON film_actor.film_id = film.film_id
    JOIN actor 
    ON film_actor.actor_id = actor.actor_id;
   
   
CREATE VIEW  actori_per_film AS
SELECT film.title as 'film', COUNT(film.title) AS 'nr_actori'  FROM film 
	JOIN film_actor 
    ON film_actor.film_id = film.film_id
    JOIN actor 
    ON film_actor.actor_id = actor.actor_id
    GROUP BY film.title;

SELECT * FROM actori_per_film;


-- Creați un VIEW numit studenti_note
 --  care să afișeze numele și prenumele studentului,
 -- titlul cursului și nota obținută.

USE uni;
CREATE VIEW  studenti_note AS
  SELECT nume, prenume, titlu_curs, valoare as nota FROM studenti JOIN note ON studenti.idstudent = note.studenti_idstudent
  JOIN cursuri ON note.cursuri_id_curs = cursuri.id_curs;
  
-- Creați un VIEW numit profesori_info  
 -- care să afișeze numele și prenumele profesorului,
 -- gradul, data nașterii și vârsta calculată.
 
SELECT nume, prenume, grad, data_nasterii, (YEAR(NOW()) - YEAR(data_nasterii)) varsta  FROM profesori;
 
SELECT CURDATE();
SELECT NOW();

-- Creați un VIEW numit studenti_performanti
--  care să afișeze studenții cu media notelor 
-- peste media generală a tuturor studenților.

;
SELECT AVG (
	SELECT AVG(valoare) FROM note
	GROUP BY studenti_idstudent) 
) 
FROM medie_studenti;


