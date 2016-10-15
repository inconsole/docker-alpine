FROM redis:2.8.13

# switch to root to build image
# =================================================
USER root

# prepare rootfs
# =================================================
RUN mkdir /rootfs
WORKDIR /rootfs
RUN mkdir bin etc dev dev/pts lib usr proc sys tmp
RUN mkdir -p usr/lib64 usr/bin usr/local/bin
RUN touch etc/resolv.conf
RUN cp /etc/nsswitch.conf etc/nsswitch.conf
RUN echo root:x:0:0:root:/:/bin/sh > etc/passwd
RUN echo root:x:0: > etc/group
RUN ln -s lib lib64
RUN ln -s bin sbin

# install busybox
# =================================================
ADD http://busybox.net/downloads/binaries/1.21.1/busybox-x86_64 /sbin/busybox
RUN chmod +x /sbin/busybox
RUN cp /sbin/busybox bin
RUN busybox --install -s bin

# extract redis-server
# =================================================
RUN cp /usr/local/bin/redis-server usr/bin/redis-server

# extract redis-server's dependencies
# =================================================
RUN bash -c "cp /lib/x86_64-linux-gnu/lib{m,dl,pthread,c}.so.* lib64"
RUN cp /lib64/ld-linux-x86-64.so.2 lib64/

# build rootfs
RUN tar cf /rootfs.tar .
