.PHONY: run build start stop

run-db:
	docker exec -it dotnetcore-react-db /bin/bash 

run:
	docker exec -it dotnetcore-react /bin/bash

build:
	docker compose up -d 

start:
	docker compose start 

stop:
	docker compose down

clean:
	docker container prune -f && docker image prune -f && docker image rm dotnetcore-react-app && docker image rm dotnetcore-react-db
