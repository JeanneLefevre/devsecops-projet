NAME = monapp

COMPOSE = docker compose

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

check:
	docker ps
	docker volume ls

prune:
	docker system prune -af
	docker volume prune -f

re : clean up

all : ull
