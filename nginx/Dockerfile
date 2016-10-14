FROM alpine:latest
MAINTAINER a a@a.com
RUN apk --update add nginx
RUN mkdir -p /run/nginx/
RUN mkdir /www
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

