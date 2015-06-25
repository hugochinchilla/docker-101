app=app
env=production

build: build-app build-nginx

build-app:
	docker build -t hchinchilla/django-example .

build-nginx:
	docker build -t hchinchilla/nginx-django-example config/nginx

push: push-app push-nginx

push-app:
	docker push hchinchilla/django-example

push-nginx:
	docker push hchinchilla/nginx-django-example

deploy:
	docker-compose run --rm centurion -p example-$(app) -e $(env) -a deploy
