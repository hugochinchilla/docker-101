FROM nginx:latest

ADD nginx.conf /etc/nginx/nginx.conf.tpl
ADD start-nginx.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
