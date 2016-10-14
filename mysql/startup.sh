#!/bin/sh

if [ -d /app/mysql ]; then
  echo "[i] MySQL directory already present, skipping creation"
else
  echo "[i] MySQL data directory not found, creating initial DBs"
  mysql_install_db --user=root > /dev/null

  if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
  fi
fi

echo "mysql -e 'UPDATE mysql.user SET password=PASSWORD(\"123456\") WHERE user=\"root\"'"
echo "mysql -e 'FLUSH PRIVILEGES'"



echo "[i] MySQL starting as [root]"
exec /usr/bin/mysqld --user=root --console


