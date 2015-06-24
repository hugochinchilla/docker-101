#!/bin/bash

# wait for database to be fully started (only for development)
sleep $DB_WAIT_TIME

# execute all pending migrations
python manage.py migrate

# run CMD from Dockerfile
exec $@
