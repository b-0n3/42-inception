FROM debian:buster
RUN apt-get update -y
RUN apt-get install redis-server -y
COPY ./conf/redis.conf /etc/redis/redis.conf
CMD ["redis-server", "/etc/redis/redis.conf"]