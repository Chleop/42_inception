FROM debian:buster

RUN apt-get update \
    && apt-get install nginx -y

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]