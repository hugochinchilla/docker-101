#!/bin/bash

# wait for mysql to be fully started
sleep $MYSQL_WAIT_TIME

# execute all pending migrations
python manage.py migrate

# run CMD from Dockerfile
exec $@
