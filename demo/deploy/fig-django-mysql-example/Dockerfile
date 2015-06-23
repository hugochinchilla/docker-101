FROM python:3.4
WORKDIR /code/

ADD requirements.txt /code/
RUN pip install -r requirements.txt

EXPOSE 8080
USER root

ENTRYPOINT ["gunicorn"]

# The --workers param comes with the WEB_CONCURRENCY env_vars
CMD ["webpro.wsgi", "-b", "0.0.0.0:8080", "--log-file=-"]

# let for the very end, so everything is cached between releases
ADD . /code/
