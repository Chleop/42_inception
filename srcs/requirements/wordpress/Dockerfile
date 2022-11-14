FROM debian:buster

ARG USER_ID
ARG GROUP_ID

COPY ./pool/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y

# il y a plein de dependances a installer avant de pouvoir 
# installer php

RUN apt-get install ca-certificates apt-transport-https software-properties-common -y wget curl lsb-release
#RUN curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
#RUN sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
#RUN apt-get update -y
# Il faut installer php7.3-fpm car autrement avec php-fpm on 
# telecharge apache avec (un serveur web equivalent a nginx)
# et toutes les dependences sont faites avec apache, or nous
# on veut nginx
RUN apt-get install php7.3-fpm -y php-mysql -y php-cgi -y
#RUN apt-get install php php-fpm -y php-mysql -y php-cgi -y
RUN service php7.3-fpm start

#ai essaye avec le set ci-dessous (le meme que Lea) et j'ai la meme erreur
#RUN apt-get update -y && apt-get install -y wget \
#php \
#php-cgi \
#php-mysql \
#php-fpm \
# php-pdo \
# php-gd php-cli \
# php-mbstring

#ai essaye avec le set ci-dessous (le meme que le pote de Jo et Matthieu) et j'ai la meme erreur
#RUN apt update -y && apt upgrade -y && apt install curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip gettext-base -y


RUN usermod -u ${USER_ID} www-data
RUN groupmod -g ${GROUP_ID} www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var /var/www /var/www/html
#RUN chmod 777 /var/www/html


EXPOSE 9000 3306

USER www-data

#CMD ["php-fpm8"]
CMD ["tail", "-f", "/dev/null"]
