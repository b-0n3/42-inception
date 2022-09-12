FROM debian:buster 
RUN apt-get update -y
RUN  apt -y install mariadb-server mariadb-client
COPY config.sh /tmp/config.sh

CMD ["sh", "/tmp/config.sh"]
