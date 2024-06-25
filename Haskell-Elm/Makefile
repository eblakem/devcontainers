.PHONY: run build start stop

run-db:
	docker exec -it haskell-elm-db /bin/bash 

run:
	docker exec -it haskell-elm /bin/bash

build:
	docker compose up -d 

start:
	docker compose start 

stop:
	docker compose down

clean:
	docker container prune -f && docker image prune -f && docker image rm haskell-elm-app
