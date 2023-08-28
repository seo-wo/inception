#!/bin/bash

FLAG=./wp-config.php

if [ -f $FLAG ]; then
  echo "Wordpress already installed"
else
  echo "Installing Wordpress"

  wp core download \
    --allow-root

  wp config create \
    --allow-root \
    --dbname=${DB_DATABASE} \
    --dbuser=${DB_USER} \
    --dbpass=${DB_PASSWORD} \
    --dbhost=${DB_HOST}

  wp core install \
    --allow-root \
    --url=${WORDPRESS_URL} \
    --title=${WORDPRESS_TITLE} \
    --admin_user=${WORDPRESS_ADMIN} \
    --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
    --admin_email=${WORDPRESS_ADMIN_EMAIL}

  wp user create \
    --allow-root \
    ${WORDPRESS_USER} \
    ${WORDPRESS_USER_EMAIL} \
    --role=author \
    --user_pass=${WORDPRESS_USER_PASSWORD}
  
fi

exec php-fpm7.4 -F
exec "$@"