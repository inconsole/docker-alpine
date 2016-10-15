#docker run --name mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 inorz/mysql:v5.5.52

------------------------------
Environment Variables

When you start the mysql image, you can adjust the configuration of the MySQL instance by passing one or more environment variables on the docker run command line. Do note that none of the variables below will have any effect if you start the container with a data directory that already contains a database: any pre-existing database will always be left untouched on container startup.

MYSQL_ROOT_PASSWORD

This variable is mandatory and specifies the password that will be set for the MySQL root superuser account. In the above example, it was set to my-secret-pw.

MYSQL_DATABASE

This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted superuser access (corresponding to GRANT ALL) to this database.

MYSQL_USER, MYSQL_PASSWORD

These variables are optional, used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions (see above) for the database specified by the MYSQL_DATABASE variable. Both variables are required for a user to be created.

Do note that there is no need to use this mechanism to create the root superuser, that user gets created by default with the password specified by the MYSQL_ROOT_PASSWORD variable.

MYSQL_ALLOW_EMPTY_PASSWORD

This is an optional variable. Set to yes to allow the container to be started with a blank password for the root user. NOTE: Setting this variable to yes is not recommended unless you really know what you are doing, since this will leave your MySQL instance completely unprotected, allowing anyone to gain complete superuser access.

MYSQL_RANDOM_ROOT_PASSWORD

This is an optional variable. Set to yes to generate a random initial password for the root user (using pwgen). The generated root password will be printed to stdout (GENERATED ROOT PASSWORD: .....).

MYSQL_ONETIME_PASSWORD

Sets root (not the user specified in MYSQL_USER!) user as expired once init is complete, forcing a password change on first login. NOTE: This feature is supported on MySQL 5.6+ only. Using this option on MySQL 5.5 will throw an appropriate error during initialization.

-----------------------------------------------
The Docker documentation is a good starting point for understanding the different storage options and variations, and there are multiple blogs and forum postings that discuss and give advice in this area. We will simply show the basic procedure here for the latter option above:

Create a data directory on a suitable volume on your host system, e.g. /my/own/datadir.
Start your mysql container like this:

$ docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
The -v /my/own/datadir:/var/lib/mysql part of the command mounts the /my/own/datadir directory from the underlying host system as /var/lib/mysql inside the container, where MySQL by default will write its data files.


Creating database dumps

Most of the normal tools will work, although their usage might be a little convoluted in some cases to ensure they have access to the mysqld server. A simple way to ensure this is to use docker exec and run the tool from the same container, similar to the following:

$ docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p\"$MYSQL_ROOT_PASSWORD\"' > /some/path/on/your/host/all-databases.sql


