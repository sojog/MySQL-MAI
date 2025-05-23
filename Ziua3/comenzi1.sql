

CREATE USER 'user_de_test'@'127.0.0.1' IDENTIFIED BY 'parola';

SHOW DATABASES;

GRANT SELECT ON uni.studenti TO 'user_de_test'@'127.0.0.1';

GRANT UPDATE ON uni.studenti TO 'user_de_test'@'127.0.0.1';

GRANT SELECT ON uni.* TO 'user_de_test'@'127.0.0.1';


CREATE DATABASE baza_de_date_de_sters;

GRANT SELECT, UPDATE, INSERT, DELETE 
	ON baza_de_date_de_sters.* 
    TO 'user_de_test'@'127.0.0.1';


CREATE USER 'user_de_oriunde'@'%' IDENTIFIED BY 'parola';
GRANT ALL PRIVILEGES ON baza_de_date_de_sters.* TO 'user_de_oriunde'@'%';


GRANT ALL PRIVILEGES ON baza_de_date_de_sters TO 'user_de_oriunde';

GRANT SELECT, UPDATE, INSERT, DELETE 
	ON uni.studenti 
    TO 'user_de_test'@'127.0.0.1';

REVOKE DELETE ON uni.studenti FROM 'user_de_test'@'127.0.0.1';

CREATE DATABASE baza_de_date_de_sters;
GRANT ALL PRIVILEGES ON baza_de_date_de_sters.* TO 'user_de_oriunde'@'%';

REVOKE ALL PRIVILEGES ON baza_de_date_de_sters.* FROM 'user_de_oriunde'@'%';

SELECT user, host, plugin, authentication_string FROM mysql.user ;

CREATE DATABASE db_privilegii;
CREATE USER privilegii_de_admin@'127.0.0.1' IDENTIFIED BY 'xyz';

DROP USER privilegii_de_admin@'127.0.0.1';

GRANT ALL PRIVILEGES ON db_privilegii.* TO privilegii_de_admin@'127.0.0.1';

DROP USER boola@'127.0.0.1';
DROP USER privilegii_admin@'127.0.0.1';

CREATE USER privilegii_de_user@'%' IDENTIFIED BY '123';
GRANT select, insert, update, delete ON db_privilegii.* TO privilegii_de_user@'%' ;

DROP USER privilegii_de_user@'%';

REVOKE ALL PRIVILEGES ON db_privilegii.* FROM privilegii_de_admin@'127.0.0.1';

SELECT user, host, plugin, authentication_string FROM mysql.user 


