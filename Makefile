up:
	docker-compose up

upd:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

docker-build:
	docker build . -t dio123/envoy-issue-8025

docker-push:
	docker push dio123/envoy-issue-8025

toggle:
	docker-compose exec envoy "/etc/toggle.sh"

.PHONY: up upd down toggle
