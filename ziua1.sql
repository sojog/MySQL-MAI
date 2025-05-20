
SHOW DATABASES;

CREATE DATABASE oameni;

USE oameni;

CREATE TABLE detalii_personale 
	(id INT PRIMARY KEY AUTO_INCREMENT,    
    nume VARCHAR(200),
    prenume VARCHAR(200));
    
SELECT * FROM detalii_personale;

# Creați tabelul: people
-- id-ul de utilizator, care va crește automat cu 1 la fiecare intrare și care va fi cheia primară a tabelului
-- first_name
-- last_name

CREATE TABLE oameni.people
(id INT, frist_name VARCHAR(100), last_name VARCHAR(100));

DROP TABLE people;

CREATE TABLE `oameni`.`people`
(id INT PRIMARY KEY AUTO_INCREMENT, frist_name VARCHAR(100), last_name VARCHAR(100));

USE oameni;

INSERT INTO people VALUES (1,"Ion", "Creanga");
SELECT * FROM people;

INSERT INTO people VALUES (3,"Ion", "Iliescu");
SELECT * FROM people;

INSERT INTO people (frist_name, last_name) 
	VALUES ("Mihai", "Eminescu");
SELECT * FROM people;

INSERT INTO people SET frist_name = "Vasile",
	last_name = "Alecsandri";
SELECT * FROM people;

INSERT INTO people (frist_name, last_name) 
	VALUES ("Florin", "Raducioiu"),
			("Gica", "Hagi"),
            ("Dan", "Petrescu");
SELECT * FROM people;

ALTER TABLE people ADD COLUMN username VARCHAR(20);
SELECT * FROM people;

SELECT concat(frist_name, last_name) FROM people;

SELECT concat(frist_name, " ",last_name) FROM people;

SELECT concat(frist_name, " ",last_name) AS 'Nume complet' 
	FROM people;

SELECT frist_name last_name FROM people;

SELECT frist_name, last_name FROM people;

SELECT frist_name AS "last name" FROM people;

SELECT frist_name "last name" FROM people;

# Acest script va șterge baza de date existentă dacă există.
DROP DATABASE IF EXISTS online_store;
CREATE DATABASE IF NOT EXISTS online_store;

# Trebuie creat un script pentru a crea tabelul computer_parts 
CREATE TABLE computer_parts ( id INT AUTO_INCREMENT,
	cod VARCHAR(5),
    tip VARCHAR(20) DEFAULT 'Electronic',
    nume VARCHAR(100) UNIQUE NOT NULL,
    pret DECIMAL(7, 2),
	PRIMARY KEY (id) 
);

SELECT * FROM computer_parts;


CREATE TABLE echipe (nume VARCHAR(200), 
	anul_infiintarii INT, 
	cod_unic INT UNIQUE NOT NULL AUTO_INCREMENT);


INSERT INTO echipe (nume, anul_infiintarii) 
	VALUES  ("Dinamo", 1948), ("Steaua", 1947), ("Rapid", 1923),
		("Hubita", 2022); 

SELECT * FROM echipe;

INSERT INTO echipe (nume, anul_infiintarii) 
	VALUES  ("Milan", 1899), ("CFR", 1907), ("U Cluj", 1918),
		("Slobozia", 2009); 
        
SELECT * FROM echipe;

SELECT * FROM echipe ORDER BY anul_infiintarii;

SET @@sql_safe_updates = 0;

DELETE FROM echipe WHERE anul_infiintarii >= 1918
	AND anul_infiintarii < 1945;

SELECT * FROM echipe ORDER BY anul_infiintarii;


SELECT * FROM people;
DELETE FROM people WHERE frist_name = "Ion";
SELECT * FROM people;


SET SQL_SAFE_UPDATES = 1;

INSERT INTO people VALUES (1,"Ion", "Creanga", NULL);
SELECT * FROM people;
INSERT INTO people VALUES (3,"Ion", "Iliescu", NULL);
SELECT * FROM people;

DELETE FROM people WHERE frist_name = "Ion";
SELECT * FROM people;
DELETE FROM people WHERE id < 4;
SELECT * FROM people;