




SELECT 10;

DELIMITER $$

SELECT 10$$
SELECT 20$$

DELIMITER //

CREATE PROCEDURE salutare()
BEGIN
	SELECT 'Salutare din procedura';
    SELECT 'Salutare din procedura';
END
//

DELIMITER ;

CALL salutare();

USE db_tran;

DROP PROCEDURE adauga_valoare;
DELIMITER //
CREATE PROCEDURE adauga_valoare (IN new_val VARCHAR(255))
BEGIN
	INSERT INTO tb_tran SET value = new_val;
END//

DELIMITER ;

CALL adauga_valoare("procedural");

SELECT * FROM tb_tran;

DELIMITER //
CREATE PROCEDURE adauga_valoare_cu_id (IN new_id INT, IN new_val VARCHAR(255))
BEGIN
	INSERT INTO tb_tran SET value = new_val;
END//

DELIMITER ;

CALL adauga_valoare_cu_id(20, "procedural cu id");

SELECT * FROM tb_tran;


CALL procedure_in_procedure;




