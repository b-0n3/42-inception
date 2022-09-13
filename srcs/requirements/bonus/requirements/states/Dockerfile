FROM alpine:3.16

RUN apk --update add --no-cache \
    supervisor \
    nodejs \
    npm \
    docker \
    sqlite

RUN mkdir -p /opt/docker-stats/db
RUN apk --update add --no-cache --virtual .build-deps \
    make python3 gcc g++ libc-dev && \
    cd /opt/docker-stats && \
    npm update && \
    npm install express sqlite3 body-parser moment --build-from-source=sqlite3 && \
    apk del .build-deps

ADD ./tools/stats.js /opt/docker-stats/
ADD ./tools/httpd.js /opt/docker-stats/
ADD ./tools/html/ /opt/docker-stats/html/rs
ADD ./tools/supervisord.conf /etc/supervisord.conf

EXPOSE 8080
CMD ["/usr/bin/supervisord"]