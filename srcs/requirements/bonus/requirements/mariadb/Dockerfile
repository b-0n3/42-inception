FROM debian:buster 
RUN apt-get update -y
RUN  apt -y install mariadb-server mariadb-client
COPY tools/config.sh /tmp/config.sh
COPY tools/wordpress.sql /tmp/wordpress.sql
# ADD ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["sh", "/tmp/config.sh"]
