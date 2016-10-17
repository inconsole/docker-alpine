FROM alpine:3.4
MAINTAINER ph4nf4n ph4nf4n@qq.com

COPY motd /etc/motd
RUN mkdir /git

#ssh-dev
RUN apk add --update \
    git \
    openssh && ssh-keygen -A && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:296898' | chpasswd

#adduser-git
RUN adduser -D git && echo "git:git!!~" | chpasswd
RUN chown -R git:git /git


EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
