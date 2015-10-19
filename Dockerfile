FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx

RUN sed -i 's/Welcome to nginx/Welcome to Chubo Deshita? container!/g' /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
