#!/bin/bash

service mysql start

sleep 3

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > sql_script.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> sql_script.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' ;" >> sql_script.sql

echo "FLUSH PRIVILEGES;" >> sql_script.sql
mysql  < sql_script.sql
service mysql stop

exec mysqld