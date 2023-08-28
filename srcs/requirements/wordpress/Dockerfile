FROM \
debian:bullseye

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y \
curl \
php \
php-fpm \
php-mysql \
php-mysqli \
mariadb-client \
sendmail

RUN \
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && \
mkdir -p /var/www/html && \
chown -R www-data:www-data /var/www/html && \
mkdir -p /run/php

COPY \
./tools/wordpress.sh /tmp/wordpress.sh

COPY \
./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN \
apt-get install -y \
dumb-init

RUN \
chmod +x /tmp/wordpress.sh

EXPOSE \
9000

WORKDIR \
/var/www/html

ENTRYPOINT \
["/usr/bin/dumb-init", "--"]

CMD \
["sh", "/tmp/wordpress.sh"]
