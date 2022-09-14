from debian:buster as ssl-gen
RUN  apt-get update -y
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /vsftpd.key -out /vsftpd.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=21school/CN=b-one"

FROM debian:buster
RUN apt-get update -y
RUN apt-get install vsftpd -y
RUN adduser  --disabled-password --gecos '' ftpuser
RUN echo "ftpuser:ftpuser" | chpasswd
RUN mkdir -p /home/ftpuser/ftp
RUN chown -R ftpuser:ftpuser /home/ftpuser/ftp
RUN chmod -R 777 /home/ftpuser/ftp
RUN  mkdir -p /etc/ssl/private
COPY --from=ssl-gen /vsftpd.key  /etc/ssl/private/vsftpd.key 
COPY --from=ssl-gen /vsftpd.crt /etc/ssl/private/vsftpd.crt 
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/start.sh /start.sh
RUN chmod +x /start.sh
CMD [ "sh" , "/start.sh" ]