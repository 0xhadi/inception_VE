FROM    debian:buster
RUN     apt-get update -y && apt-get install nginx -y && apt-get install -y openssl
# https://www.plesk.com/blog/various/nginx-configuration-guide/
# https://www.cloudsigma.com/nginx-server-and-location-block-selection-algorithms-overview/#:~:text=The%20first%20attempt%20by%20Nginx,the%20first%20on%20the%20list.

# https://www.cloudflare.com/learning/ssl/what-is-https/#:~:text=HTTPS%20occurs%20based%20upon%20the,to%20start%20the%20secure%20session.
# https://www.entrust.com/resources/certificate-solutions/learn/how-does-ssl-work#:~:text=The%20web%20server%20sends%20the,start%20an%20SSL%20encrypted%20session.
# https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-debian-10

RUN     openssl req -newkey rsa:2048 -nodes -keyout private.key -x509 -days 365 -out cert.crt -subj "/CN=mhadi.42.fr"

RUN     mkdir /etc/nginx/ssl/ && mv private.key cert.crt /etc/nginx/ssl/ 

# RUN     echo "fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;" >> /etc/nginx/fastcgi_params

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

CMD     ["nginx", "-g", "daemon off;"]  