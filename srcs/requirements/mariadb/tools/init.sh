#!/bin/sh
SQL_FILE=/tmp/init.sql

if [ -f $SQL_FILE ]; then
  echo "SQL file already exists"
else
  echo "SQL file does not exist"
  /etc/init.d/mariadb start
  sleep 5
  echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" >> $SQL_FILE
  echo "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;" >> $SQL_FILE
  echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> $SQL_FILE
  echo "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';" >> $SQL_FILE
  echo "FLUSH PRIVILEGES;" >> $SQL_FILE
  mysql -u root < $SQL_FILE
  echo "Database created"
  # /etc/init.d/mariadb stop
  # pkill mysqld mysqld_safe
fi
mysqld_safe
exec "$@"