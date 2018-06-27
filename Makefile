default: build start

init:
	docker run --rm -v $(pwd):/www grembold/rpi-hugo new site . --force

build:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo

start:
	#docker-compose up -d  --force-recreate;
	docker stack deploy --resolve-image never --compose-file docker-compose.yml magicBrokoli

update:
	docker stack deploy --resolve-image never --compose-file docker-compose.yml magicBrokoli
	# --resolve-image na das image arm1176 architektur meldet und der node aber 	linux armv7l
test:
	docker-compose up --force-recreate;
#	docker run --rm -p 1313:1313 -v $(pwd):/www grembold/rpi-hugo server -b http://192.168.178.141 --bind=0.0.0.0 -w -D

version:
	docker run --rm grembold/rpi-hugo version

benchmark:
	docker run --rm -v $(pwd):/www grembold/rpi-hugo benchmark

check:
	docker run --rm -v $(pwd):/www grembold/rpi-hugo check

server:
	docker run --rm -v $(pwd):/www grembold/rpi-hugo server $(arg)
