
SHOW VARIABLES;

SELECT @@autocommit;

SET @@autocommit = 0;



CREATE DATABASE db_tran;

USE db_tran;

CREATE TABLE tb_tran (id INT PRIMARY KEY AUTO_INCREMENT,
	value VARCHAR(255));
    
    
GRANT SELECT, UPDATE, DELETE, INSERT ON db_tran.* TO "sakila_viewer"@"%";
    
START TRANSACTION;

SELECT *  FROM tb_tran;

INSERT INTO tb_tran SET value = "rosu";
    
SELECT *  FROM tb_tran;

COMMIT;


SELECT @@autocommit;
SET @@autocommit := 0;

START TRANSACTION;

INSERT INTO tb_tran SET value = "negru";
COMMIT;
SELECT *  FROM tb_tran;

START TRANSACTION;

INSERT INTO tb_tran SET value = "verde";
INSERT INTO tb_tran SET value = "mov";
INSERT INTO tb_tran SET value = "violet";

SELECT *  FROM tb_tran;

ROLLBACK;
SELECT *  FROM tb_tran;

INSERT INTO tb_tran SET value = "violet";

SELECT *  FROM tb_tran;



SET @@autocommit := 1;


START TRANSACTION;
INSERT INTO tb_tran SET value = "violet";
COMMIT;

SET @@autocommit = 1;
START TRANSACTION;
INSERT INTO tb_tran SET value = "violet";


SET @@autocommit = 0;

INSERT INTO tb_tran SET value = "fuchsia";
SELECT * FROM tb_tran;

COMMIT;

SELECT * FROM tb_tran;

INSERT INTO tb_tran SET value = "100";
INSERT INTO tb_tran SET value = "100";
INSERT INTO tb_tran SET value = "100";
SELECT * FROM tb_tran;

SAVEPOINT S100;


INSERT INTO tb_tran SET value = "200";
INSERT INTO tb_tran SET value = "200";
INSERT INTO tb_tran SET value = "200";
SELECT * FROM tb_tran;

ROLLBACK TO SAVEPOINT S100;
SELECT * FROM tb_tran;


GRANT SELECT, UPDATE, DELETE, INSERT ON db_tran.*
	TO "sakila_viewer"@"%";
    
ROLLBACK;

SELECT * FROM tb_tran;

INSERT INTO tb_tran SET value = "aaa";
INSERT INTO tb_tran SET value = "aaa";
INSERT INTO tb_tran SET value = "aaa";
SELECT * FROM tb_tran;
SAVEPOINT aaa;

INSERT INTO tb_tran SET value = "bbb";
INSERT INTO tb_tran SET value = "bbb";
INSERT INTO tb_tran SET value = "bbb";
SELECT * FROM tb_tran;
SAVEPOINT bbb;


INSERT INTO tb_tran SET value = "ccc";
INSERT INTO tb_tran SET value = "ccc";
INSERT INTO tb_tran SET value = "ccc";
SELECT * FROM tb_tran;
SAVEPOINT ccc;

INSERT INTO tb_tran SET value = "ddd";
INSERT INTO tb_tran SET value = "ddd";
INSERT INTO tb_tran SET value = "ddd";
SELECT * FROM tb_tran;

ROLLBACK TO SAVEPOINT bbb;
SELECT * FROM tb_tran;

ROLLBACK;


SELECT *  FROM tb_tran;

REVOKE INSERT ON  db_tran.* FROM "sakila_viewer"@"%"; 

