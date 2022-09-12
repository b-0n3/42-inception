FROM debian:buster 
RUN apt-get update -y
RUN  apt -y install mariadb-server mariadb-client
COPY tools/config.sh /tmp/config.sh
COPY tools/wordpress.sql /tmp/wordpress.sql

CMD ["sh", "/tmp/config.sh"]
