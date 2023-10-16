#!/bin/bash

mkdir -p /var/www/
mkdir -p /var/www/wordpress

rm -rf  /var/www/wordpress/*

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

wp core download  --allow-root

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=mariadb --allow-root 

wp core install --url=$WP_URL --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root 

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root 


mkdir -p /run/php


exec /usr/sbin/php-fpm7.3 -F 

