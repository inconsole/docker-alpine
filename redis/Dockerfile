FROM scratch
MAINTAINER a <a@a.io>
ADD rootfs.tar /
WORKDIR /data
VOLUME /data
# Define default command.
EXPOSE 6379
ENTRYPOINT ["/usr/bin/redis-server"]
CMD ["--port", "6379"]
