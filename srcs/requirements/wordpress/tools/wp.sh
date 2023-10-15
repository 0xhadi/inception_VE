#!/bin/bash





WP_PATH=/var/www/wordpress
mkdir -p /var/www/
mkdir -p $WP_PATH

rm -rf  $WP_PATH/*
echo $DB_NAME  $DB_USER $WP_ADMIN_EMAIL $WP_ADMIN  $WP_ADMIN_PWD 

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar
echo "                 1     xxxxxxxxxxxxxxxxxxxxxx              "
mv wp-cli.phar /usr/local/bin/wp
echo "               2       xxxxxxxxxxxxxxxxxxxxxx              "
wp core download --path=/var/www/wordpress --allow-root
echo "                3      xxxxxxxxxxxxxxxxxxxxxx              "



cd /var/www/wordpress

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=mariadb --allow-root 
echo "             4         xxxxxxxxxxxxxxxxxxxxxx              "
wp core install --url=$WP_URL --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root 
echo "            5          xxxxxxxxxxxxxxxxxxxxxx              "
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root 


mkdir -p /run/php


exec /usr/sbin/php-fpm7.3 -F 

