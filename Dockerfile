# syntax=docker/dockerfile:1
FROM golang:alpine
WORKDIR /go/src/github.com/fatindeed/grpc-demo
COPY . .
RUN set -e; \
    go mod tidy; \
    CGO_ENABLED=0 GOOS=linux go build -o bin/server server/server.go; \
    CGO_ENABLED=0 GOOS=linux go build -o bin/client client/client.go;

FROM alpine
COPY --from=0 /go/src/github.com/fatindeed/grpc-demo/bin/* /usr/local/bin/
CMD ["/usr/local/bin/server"]