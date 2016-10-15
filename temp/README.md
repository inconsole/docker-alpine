$docker run -d temp:latest
$docker ps
CONTAINER ID        IMAGE               COMMAND                  	CREATED             STATUS              PORTS                    NAMES
2779bca0c7e5        temp:latest            "/entrypoint.sh demo"   2 seconds ago       Up 1 seconds        6379/tcp                 stoic_galileo
$docker cp 2779bca0c7e5:/rootfs.tar /tmp/