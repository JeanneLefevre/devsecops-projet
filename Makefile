COMPOSE = docker compose
APP_SERVICE = app
DB_SERVICE = db
ENV_DEV = .env.dev
ENV_PROD = .env.prod

# Lancer tout en mode DEV (API + DB)
dev:
	$(COMPOSE) --env-file $(ENV_DEV) up -d --build

# Lancer tout en mode PROD (API + DB)
prod:
	$(COMPOSE) --env-file $(ENV_PROD) up -d --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

prune:
	docker system prune -af
	docker volume prune -f

logs:
	$(COMPOSE) logs -f $(APP_SERVICE)

exec:
	$(COMPOSE) exec $(APP_SERVICE) sh

check:
	docker ps
	docker volume ls

rebuild: clean dev

up: dev
re: rebuild
