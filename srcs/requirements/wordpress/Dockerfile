FROM debian:buster

ARG USER_ID
ARG GROUP_ID

COPY ./pool/wordpress_pool.conf /etc/php/8.1/fpm/pool.d/www.conf

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y

# il y a plein de dependances a installer avant de pouvoir 
# installer php
RUN apt-get install ca-certificates apt-transport-https software-properties-common -y wget curl lsb-release
RUN curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update -y
# Il faut installer php8.1-fpm car autrement avec php-fpm on 
# telecharge apache avec (un serveur web equivalent a nginx)
# et toutes les dependences sont faites avec apache, or nous
# on veut nginx
RUN apt-get install php8.1-fpm -y php-mysql -y php-cgi -y
RUN service php8.1-fpm start

RUN usermod -u ${USER_ID} www-data
RUN groupmod -g ${GROUP_ID} www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var /var/www /var/www/html /var/www/html/wordpress
#RUN chmod 777 /var/www/html


EXPOSE 9000 3306

USER www-data

#CMD ["php-fpm8"]
CMD ["tail", "-f", "/dev/null"]
