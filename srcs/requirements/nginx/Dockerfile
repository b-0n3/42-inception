FROM debian:buster as ssl-gen
RUN apt-get update && apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=21/CN=aait-ham-42.fr"


FROM  debian:buster 

RUN apt-get update -y
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl

COPY  --from=ssl-gen /etc/nginx/ssl/nginx.crt  /etc/nginx/ssl/nginx.crt
COPY  --from=ssl-gen /etc/nginx/ssl/nginx.key  /etc/nginx/ssl/nginx.key

COPY ./conf/aait-ham.42.fr.conf /etc/nginx/sites-available/default

# COPY ./nginx.conf /etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]