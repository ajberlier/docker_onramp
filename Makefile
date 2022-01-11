#TODO: add a help target that list all the targets

images:
	docker images

build: 
	docker build

run:
	docker run

list: 
	docker ps

rmi-all: 
	docker rmi $$(docker images -a -q)

rm-all:
	docker rm $$(docker ps -a -q)

kill-all: 
	docker kill $$(docker ps -a -q)

dc-build: 
	docker-compose build

dc-up:
	docker-compose up -d

dc-up-non-daemon:
	docker-compose up

dc-start: 
	docker-compose start

dc-stop:
	docker-compose stop

dc-stop-all:
	docker stop $$(docker ps -a -q)

dc-remove-all:
	docker rm $$(docker ps -a -q)

dc-restart:
	docker-compose stop && docker-compose start

dc-down: 
	docker-compose down

dc-list:
	docker-compose ps

finish:
	-docker rm -f $$(docker ps -a -q)
	docker rmi -f $$(docker images -a -q)
