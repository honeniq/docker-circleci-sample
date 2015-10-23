FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx

ADD ./resource/index.html /usr/share/nginx/html/index.html
ADD ./resource/tai.png /usr/share/nginx/html/tai.png
ADD ./resource/whale.png /usr/share/nginx/html/whale.png
ADD ./resource/seigaiha.gif /usr/share/nginx/html/seigaiha.gif

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
