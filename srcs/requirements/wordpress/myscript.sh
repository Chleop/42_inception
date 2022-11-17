wp core download
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME
wp core install --url="cproesch.42.fr" --title="SITE DE CPROESCH" --admin_user="cproesch" --admin_password="cproesch" --admin_email="votre@email.com" \
    && wp user create bob bob@example.com --role=author --user_pass=bob
/usr/sbin/php-fpm7.3 -F