# https://makefiletutorial.com/

all: test

test:
	go test -cover -v ./...

build:
	CGO_ENABLED=0 go build -o bin/reserve-proxy main.go

protocgen:
	protoc --go_out=. --go_opt=paths=source_relative\
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		routeguide/route_guide.proto

docker-build:
	DOCKER_BUILDKIT=0 docker build -t fatindeed/grpc-demo .