FROM ubuntu

RUN apt-get update
RUN apt-get install nginx -y

COPY html/index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]
