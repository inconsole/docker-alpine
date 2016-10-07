FROM alpine:latest
MAINTAINER 1111 2222@qq.com
RUN apk --update add nginx
RUN mkdir -p /run/nginx/
RUN mkdir -p /etc/nginx/site-enable/
RUN mkdir /www
COPY nginx.conf /etc/nginx/
COPY demo.conf /etc/nginx/site-enable/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
