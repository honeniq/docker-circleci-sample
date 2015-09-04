FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx
RUN sed -i 's/Welcome to nginx/Welcome to test container/g' /usr/share/nginx/html/index.html
