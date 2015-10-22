FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx

ADD ./resource/whale.png /usr/share/nginx/html/whale.png
ADD ./resource/index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
