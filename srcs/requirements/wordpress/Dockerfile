FROM debian:buster

#####################################################################
# Recuperer les args uid et gid et modifier www-data                #
#####################################################################
ARG USER_ID
ARG GROUP_ID
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_HOSTNAME

RUN usermod -u ${USER_ID} www-data \
    && groupmod -g ${GROUP_ID} www-data

#####################################################################
# Installer PHP-FPM                                                 #
#####################################################################
# Il faut installer php7.3-fpm car autrement avec php-fpm on 
# telecharge apache avec (un serveur web equivalent a nginx)
# et toutes les dependences sont faites avec apache, or nous
# on veut nginx
RUN apt-get update -y && apt-get upgrade -y && apt-get install vim -y \
    && apt-get install -y ca-certificates apt-transport-https \
    software-properties-common lsb-release curl php7.3-fpm php-mysql \
    php-cgi php-curl php-gd php-intl php-mbstring php-soap php-xml \
    php-xmlrpc php-zip mariadb-client

#####################################################################
# Remplacer la configuration par defaut de php fpm                  #
#####################################################################
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN chown -R www-data:www-data /run

#####################################################################
# Creer le dossier wordpress pour y inserer les fichiers wordpress  #
# et donner la propriete au user www-data                           #
#####################################################################
RUN mkdir -p /var/www/html/wordpress \
    && chown -R www-data:www-data /var/www /var/www/html /var/www/html/wordpress

#####################################################################
# Installer wp-CLI                                                  #
#####################################################################

WORKDIR /var/www/html/wordpress

#####################################################################
# Pour utiliser WP-CLI à partir de la ligne de commande en tapant wp, 
# rend le fichier exécutable et le deplace dans un dossier bin                                                #
#####################################################################
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && chown -R www-data:www-data wp-cli.phar && cp wp-cli.phar /usr/local/bin/wp

COPY myscript.sh .
RUN chmod +x myscript.sh

USER www-data

EXPOSE 9000 3306

ENTRYPOINT ["sh", "myscript.sh"]
