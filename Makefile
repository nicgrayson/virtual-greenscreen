.PHONY: build create delete start stop

build:
	docker build -t bodypix ./bodypix
	docker build -t fakecam ./fakecam

create:
	docker network create --driver bridge fakecam
	docker run -d --name=bodypix --network=fakecam -p 9000:9000 bodypix
	docker run -d --name=fakecam --network=fakecam -u "$$(id -u):$$(getent group video | cut -d: -f3)" $$(find /dev -name 'video*' -printf "--device %p ") fakecam

delete:
	docker kill bodypix || true
	docker kill fakecam || true
	docker rm bodypix || true
	docker rm fakecam || true
	docker network rm fakecam

stop:
	docker stop bodypix
	docker stop fakecam

start:
	docker start bodypix
	docker start fakecam
