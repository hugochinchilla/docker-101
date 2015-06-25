#!/bin/bash
# because nginx doesn't support environemnt variables on its config file we
# have to make substitutions with sed before starting it.

cp /etc/nginx/nginx.conf.tpl /etc/nginx/nginx.conf
sed -i "s/%gunicorn-ip%/$GUNICORN_PORT_8080_TCP_ADDR/" /etc/nginx/nginx.conf
sed -i "s/%gunicorn-port%/$GUNICORN_PORT_8080_TCP_PORT/" /etc/nginx/nginx.conf

nginx -g "daemon off;"
