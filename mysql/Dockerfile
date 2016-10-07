FROM alpine:latest
MAINTAINER WangXian <xian366@126.com>

WORKDIR /app
VOLUME /app
COPY startup.sh /startup.sh

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
RUN mkdir -p /app/mysql

EXPOSE 3306
CMD ["/bin/sh","/startup.sh"]
