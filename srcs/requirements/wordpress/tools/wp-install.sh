#!/bin/bash

while ! mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASS $WP_DATABASE_NAME &>/dev/null; do
  sleep 3
done

# mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASS $WP_DATABASE_NAME &>/dev/null
if [ ! -f /var/www/html/wp-config.php ]; then
    apt-get update -y && apt-get upgrade -y && apt-get install curl -y
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html
    wp core download --allow-root
    wp config create --dbname=$WP_DATABASE_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
    wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root
fi

exec "$@"