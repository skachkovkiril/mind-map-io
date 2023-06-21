DC = docker compose
ODB = -f docker-compose-only-db.yaml
AWB = -f docker-compose-without-backend.yaml
AWF = -f docker-compose-without-frontend.yaml

START = up --build -d --remove-orphans

build:
	$(DC) $(START)

down:
	$(DC) down

show-logs:
	$(DC) logs

activate:
	cd backend && SET PIPENV_DOTENV_LOCATION=../.env && pipenv shell

run-db:
	$(DC) $(ODB) $(START)

stop-db:
	$(DC) $(ODB) down

run-app-without-backend:
	$(DC) $(AWB) $(START)

stop-app-without-backend:
	$(DC) $(AWB) down

run-app-without-frontend:
	$(DC) $(AWF) $(START)

stop-app-without-frontend:
	$(DC) $(AWF) down