FROM    debian:buster

RUN     apt-get update -y && apt-get install mariadb-server -y

COPY    ./tools/create_db.sh /

COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN     chmod +x create_db.sh 

CMD  ["sh", "create_db.sh"]


