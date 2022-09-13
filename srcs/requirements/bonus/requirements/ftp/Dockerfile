FROM debian:buster

RUN apt-get update -y
RUN apt-get install vsftpd -y
RUN apt-get install openssl -y
RUN adduser  --disabled-password --gecos '' ftpuser
RUN echo "ftpuser:ftpuser" | chpasswd
RUN mkdir -p /home/ftpuser/ftp
RUN chown -R ftpuser:ftpuser /home/ftpuser/ftp
RUN chmod -R 777 /home/ftpuser/ftp
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=21school/CN=ft_services"
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/start.sh /start.sh
RUN chmod +x /start.sh
CMD [ "sh" , "/start.sh" ]