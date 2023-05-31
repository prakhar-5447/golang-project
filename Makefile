postgres:
	docker run --name postgres15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:15-alpine

start:
	docker start postgres15

createdb:
	docker exec -it postgres15 createdb --username=root --owner=root golang_project

dropdb:
	docker exec -it postgres15 dropdb golang_project
	
migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose down
	
migrateup1:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose up 1
	
migratedown1:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/golang_project?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate
	
dockersqlc:
	docker run --rm -v F:/GIT/golang-project:/src -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./... 

server:
	go run main.go

mock:
	mockgen --build_flags=--mod=mod -package mockdb -destination db/mock/store.go  github.com/prakhar-5447/golang-project/db/sqlc Store


.PHONY: postgres start createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc dockersqlc test server mock