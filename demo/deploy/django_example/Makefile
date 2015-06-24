app=app
env=production

build:
	docker build -t hchinchilla/django-example .

push:
	docker push hchinchilla/django-example

deploy:
	docker-compose run --rm centurion -p example-$(app) -e $(env) -a deploy
