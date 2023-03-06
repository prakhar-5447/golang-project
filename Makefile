postgres:
	docker run --name postgres15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:15-alpine

createdb:
	docker exec -it postgres15 createdb --username=root --owner=root golang_project

dropdb:
	docker exec -it postgres15 dropdb golang_project
	
migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose down

sqlc:
	sqlc generate
	
dockersqlc:
	docker run --rm -v F:/GIT/golang-project:/src -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./... 

.PHONY: postgres createdb dropdb migrateup migratedown sqlc dockersqlc test