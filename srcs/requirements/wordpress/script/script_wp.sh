#!/bin/bash

WORDPRESS_PATH='/var/www/wordpress'

cd $WORDPRESS_PATH

echo "Waiting for MariaDB to start..."
until mysql -u root -p"${DB_ROOT_PASSWORD}" -h"mariadb" --silent; do
    sleep 2
done

if [ -f ./wp-config.php ]; then
    echo "WordPress is already set up, skipping."
else
    wp config create --allow-root \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="mariadb:3306"

    wp core install --allow-root \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL"

    wp user create "$WP_USER" "$WP_USER_EMAIL" --role=editor --user_pass="$WP_USER_PASSWORD" --allow-root
fi

if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
fi
