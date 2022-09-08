FROM debian:buster

RUN apt-get update \
    && apt-get install nginx -y openssl -y vim -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./openssl/server.crt /tmp/
COPY ./openssl/server.key /tmp/


EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
CMD ["tail", "-f", "/dev/null"]
