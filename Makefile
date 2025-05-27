pgsql:
	docker network create --driver bridge pgnet || true
	docker compose -f pgsql.docker-compose.yml up -d --build

pgadmin:
	docker compose -f pgadmin.docker-compose.yml up -d --build

full:
	pgsql
	pgadmin