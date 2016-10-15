# About this Repo

This is the Git repo of the official Docker image for [nginx](https://registry.hub.docker.com/_/nginx/). See the
Hub page for the full readme on how to use the Docker image and for information
regarding contributing and issues.

The full readme is generated over in [docker-library/docs](https://github.com/docker-library/docs),
specificially in [docker-library/docs/nginx](https://github.com/docker-library/docs/tree/master/nginx).

How to use this image

hosting some simple static content

$ docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
Alternatively, a simple Dockerfile can be used to generate a new image that includes the necessary content (which is a much cleaner solution than the bind mount above):

FROM nginx
COPY static-html-directory /usr/share/nginx/html
Place this file in the same directory as your directory of content (\"static-html-directory\"), run docker build -t some-content-nginx ., then start your container:

$ docker run --name some-nginx -d some-content-nginx
exposing the port

$ docker run --name some-nginx -d -p 8080:80 some-content-nginx
Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.

complex configuration

$ docker run --name some-nginx -v /some/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
For information on the syntax of the Nginx configuration files, see the official documentation (specifically the Beginner's Guide).

Be sure to include daemon off; in your custom configuration to ensure that Nginx stays in the foreground so that Docker can track the process properly (otherwise your container will stop immediately after starting)!

If you wish to adapt the default configuration, use something like the following to copy it from a running Nginx container:

$ docker cp some-nginx:/etc/nginx/nginx.conf /some/nginx.conf
As above, this can also be accomplished more cleanly using a simple Dockerfile:

FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
Then, build with docker build -t some-custom-nginx . and run:

$ docker run --name some-nginx -d some-custom-nginx
using environment variables in nginx configuration

Out-of-the-box, Nginx doesn't support using environment variables inside most configuration blocks. But envsubst may be used as a workaround if you need to generate your nginx configuration dynamically before nginx starts.

Here is an example using docker-compose.yml:

  image: nginx
  volumes:
   - ./mysite.template:/etc/nginx/conf.d/mysite.template
  ports:
   - \"8080:80\"
  environment:
   - NGINX_HOST=foobar.com
   - NGINX_PORT=80
  command: /bin/bash -c \"envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'\"
The mysite.template file may then contain variable references like this :

listen ${NGINX_PORT};

