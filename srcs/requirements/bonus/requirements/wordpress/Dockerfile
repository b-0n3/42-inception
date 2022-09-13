FROM debian:buster as wordpress-image

RUN apt-get update -y
RUN apt-get install wget -y
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
RUN mkdir -p  /var/www/html
RUN mv wordpress /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
RUN  rm -rf /var/www/html/wordpress/wp-config-sample.php
COPY ./tools/wp-config.php /var/www/html/wordpress/wp-config.php
ADD ./tools/wp-content /var/www/html/wordpress/wp-content

FROM debian:buster 

RUN apt-get update -y
RUN apt-get install php-fpm php-common php-mbstring php-xmlrpc \
    php-gd php-xml php-mysql php-cli php-zip php-redis php-curl -y
RUN mkdir -p /var/www/html/wordpress
COPY  --from=wordpress-image /var/www/html/wordpress /var/www/html/wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p  /run/php

CMD ["php-fpm7.3", "-FR"]