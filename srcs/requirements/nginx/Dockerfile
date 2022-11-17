FROM debian:buster

# update package manager and install desired softwares
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install nginx -y openssl -y vim -y

# pas besoin ici car fait dans wordpress 
RUN mkdir -p /var/www/html/wordpress \
    && chown -R www-data:www-data /var/www/html/wordpress

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# create ssl certificate and key and save them at the right places
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/cproesch.42.fr.crt -keyout /etc/ssl/cproesch.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=cproesch/CN=cproesch.42.fr"

# copy our modified local nginx config file inside the container
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#peut-etre pas necessaire etant donne que c'est precise dans le docker-compose
EXPOSE 443

# USER www-data

CMD ["nginx", "-g", "daemon off;"]
#CMD ["tail", "-f", "/dev/null"]
