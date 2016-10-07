FROM alpine:latest
MAINTAINER 1111 22222@qq.com

#ssh-dev
RUN apk add --update \
	openssh && ssh-keygen -A && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	echo 'root:123456' | chpasswd

#nginx-php-dev
RUN apk add --update \
	nginx \
	php5-mcrypt \
	php5-openssl \
	php5-json \
	php5-mysql \
	php5-gd \
	php5-curl \
	php5-fpm
RUN mkdir /www
RUN mkdir -p /run/nginx/
RUN mkdir -p /etc/nginx/site-enable/
COPY nginx.conf /etc/nginx/
COPY demo.conf /etc/nginx/site-enable/

EXPOSE 22 80
COPY startup.sh /startup.sh
CMD ["sh","/startup.sh"]
#CMD ["/usr/sbin/sshd","-D"]

