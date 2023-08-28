FROM \
debian:bullseye

RUN \
apt-get update \
&& apt-get install -y \
nginx \
openssl

RUN \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/seowokim.42.fr.key \
-out /etc/ssl/certs/seowokim.42.fr.crt \
-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=seowokim/CN=seowokim.42.fr"


COPY \
./conf/nginx.conf /etc/nginx/sites-available/default

RUN \
ln -f -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE \
443

RUN \
apt-get install -y \
dumb-init

ENTRYPOINT \
["/usr/bin/dumb-init", "--"]

CMD \
["nginx", "-g", "daemon off;"]