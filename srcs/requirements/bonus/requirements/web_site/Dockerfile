FROM debian:buster

RUN apt-get update -y
RUN apt-get install php -y 
RUN mkdir -p /var/www/html
ADD tools/roxy /var/www/html/roxy

EXPOSE 80
ENTRYPOINT  php -S '[::]: 80' -t /var/www/html