DC = docker-compose
ODB = -f docker-compose-only-db.yaml
AWB = -f docker-compose-without-backend.yaml
AWF = -f docker-compose-without-frontend.yaml

build:
	$(DC) up --build -d --remove-orphans

down:
	$(DC) down

show_logs:
	$(DC) logs

activate:
	cd backend && SET PIPENV_DOTENV_LOCATION=../.env && pipenv shell

run-db:
	$(DC) $(ODB) up -d

stop-db:
	$(DC) $(ODB) down

run-app-without-backend:
	$(DC) $(AWB) up -d

stop-app-without-backend:
	$(DC) $(AWB) down

run-app-without-frontend:
	$(DC) $(AWF) up -d

stop-app-without-frontend:
	$(DC) $(AWF) down