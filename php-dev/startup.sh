#!/bin/sh

#ssh-dev
/usr/sbin/sshd -D

#nginx
/usr/sbin/nginx & >/dev/null

#php-fpm
/usr/bin/php-fpm &