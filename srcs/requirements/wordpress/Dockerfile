FROM    debian:buster

RUN     apt-get update && apt-get install -y php php7.3-fpm php7.3-mysql mariadb-client curl

COPY    conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY    ./tools/wp.sh /

RUN     chmod +x wp.sh

CMD     ["sh", "/wp.sh"]