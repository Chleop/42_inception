FROM debian:buster

RUN apt-get update \
    && apt-get install nginx -y openssl -y \
    && openssl req -new -newkey rsa:2048 -nodes -out cproesch_42_fr.csr \
    -keyout cproesch_42_fr.key -subj "/C=/ST=/L=/O=/CN=cproesch.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]