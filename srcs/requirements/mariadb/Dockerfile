FROM \
debian:bullseye

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y \
mariadb-server

RUN \
mkdir -p /var/run/mysqld && \
chmod -R 777 /var/run/mysqld && \
chown -R mysql:mysql /var/run/mysqld


COPY \
./tools/init.sh /tmp/init.sh


RUN \
chmod +x /tmp/init.sh

COPY \
./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE \
3306

RUN \
apt-get install -y \
dumb-init

ENTRYPOINT \
["/usr/bin/dumb-init", "--"]

CMD \
["sh" , "/tmp/init.sh"]