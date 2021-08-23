# «заинклюдили» все переменные окружения, которые у нас есть в .env файле
include .env
# просто запускает контейнер(make up)
up:
	docker-compose up -d
# запускает контейнер и полностью перестраивает перед запуском все существующие контейнеры(make upb)
upb:
	docker-compose up -d --force-recreate --build
# останавливает все работающие контейнеры
stop:
	docker-compose stop
# подключаемся к БД PostgreSQL при помощи консольного клиента pgSQL (make db)
db:
	export PGPASSWORD=${POSTGRES_PASSWORD}; docker exec -it test_db psql -U $(POSTGRES_USER) ${POSTGRES_DB}
# быстрый способ посмотреть значения в базе данных Redis через консольную утилиту redis-cli (make r)
r:
	docker exec -it test_redis  /usr/local/bin/redis-cli
# запускает unit/integrity tests (make test)
test:
	docker exec -it test_api pytest
# подключиться к bash-консоли любого контейнера с явно указанным именем (make b c=test_api)
b:
	docker exec -it $(c) /bin/bash
