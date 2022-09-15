FROM debian:buster 
RUN apt-get update -y
RUN  apt-get install wget -y
RUN apt-get install php php-mysql -y

RUN mkdir -p /var/www/html/adminer

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

EXPOSE 80
ENTRYPOINT  php -S '[::]: 80' -t /var/www/html