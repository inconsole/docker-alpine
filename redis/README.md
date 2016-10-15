$docker run -d -p 6379:6379 redis:v1


----> shell

redis-cli -h 192.168.99.100


How to use this image

start a redis instance

$ docker run --name some-redis -d redis
This image includes EXPOSE 6379 (the redis port), so standard container linking will make it automatically available to the linked containers (as the following examples illustrate).

start with persistent storage

$ docker run --name some-redis -d redis redis-server --appendonly yes
If persistence is enabled, data is stored in the VOLUME /data, which can be used with --volumes-from some-volume-container or -v /docker/host/dir:/data (see docs.docker volumes).

For more about Redis Persistence, see http://redis.io/topics/persistence.

connect to it from an application

$ docker run --name some-app --link some-redis:redis -d application-that-uses-redis
... or via redis-cli

$ docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
Additionally, If you want to use your own redis.conf ...

You can create your own Dockerfile that adds a redis.conf from the context into /data/, like so.

FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ \"redis-server\", \"/usr/local/etc/redis/redis.conf\" ]
Alternatively, you can specify something along the same lines with docker run options.

$ docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf
Where /myredis/conf/ is a local directory containing your redis.conf file. Using this method means that there is no need for you to have a Dockerfile for your redis container.
