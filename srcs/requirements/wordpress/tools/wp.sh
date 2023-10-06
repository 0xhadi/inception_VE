#!/bin/bash


DB_HOST="mariadb"
WP_URL="mhadi.42.fr"
WP_TITLe="WP_SITE"
WP_ADMIN="mhadi"
WP_ADMIN_PWD="abc123"
WP_ADMIN_EMAIL="mahdi@42.fr"
WP_USER="wp_user"
WP_USER_EMAIL="user@42.fr"
WP_USER_PWD="123"


DB_NAME="myDB"
DB_PWD="123"
DB_USER="mhadi"


WP_PATH=/var/www/wordpress
mkdir -p /var/www/
mkdir -p $WP_PATH

rm -rf  $WP_PATH/*


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar
echo "                 1     xxxxxxxxxxxxxxxxxxxxxx              "
mv wp-cli.phar /usr/local/bin/wp
echo "               2       xxxxxxxxxxxxxxxxxxxxxx              "
wp core download --path=/var/www/wordpress --allow-root
echo "                3      xxxxxxxxxxxxxxxxxxxxxx              "


mv /wp-config.php /var/www/wordpress/ 


sed -i -r "s/database_name_here/$DB_NAME/1"   $WP_PATH/wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  $WP_PATH/wp-config.php
sed -i -r "s/password_here/$DB_PWD/1"    $WP_PATH/wp-config.php
sed -i -r "s/localhost/$DB_HOST/1"    $WP_PATH/wp-config.php


wp config create --dbname=myDB --dbuser=mhadi --dbpass=123 --dbhost=mariadb --allow-root --path=/var/www/wordpress
echo "             4         xxxxxxxxxxxxxxxxxxxxxx              "
wp core install --url=$WP_URL --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path=/var/www/wordpress
echo "            5          xxxxxxxxxxxxxxxxxxxxxx              "
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root --path=/var/www/wordpress


mkdir -p /run/php


/usr/sbin/php-fpm7.3 -F 

