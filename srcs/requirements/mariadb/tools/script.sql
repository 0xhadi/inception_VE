CREATE DATABASE mydb;
CREATE USER 'mhadi'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'mhadi'@'%' IDENTIFIED BY '12345';
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;
FLUSH PRIVILEGES;
