FROM python:2
WORKDIR /code/

ADD requirements.txt /code/
RUN pip install -r requirements.txt

EXPOSE 8080
USER root

ENTRYPOINT ["gunicorn"]

# The --workers param comes with the WEB_CONCURRENCY env_vars
CMD ["django_example.wsgi", "-b", "0.0.0.0:8080", "--log-file=-"]

ENV DJANGO_SETTINGS_MODULE django_example.settings

# let for the very end, so everything is cached between releases
ADD . /code/
