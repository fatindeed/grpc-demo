# gRPC demo test suits

Code mostly copied from [route_guide](https://github.com/grpc/grpc-go/blob/master/examples/route_guide/)

## Run the demo server

```sh
$ docker run -p 50052:50052 -d fatindeed/grpc-demo server --port 50052
```

## Run the demo client

```sh
$ docker run --rm -t fatindeed/grpc-demo client --addr host.docker.internal:50052
```

## Using gRPCurl

```sh
$ docker run --rm fullstorydev/grpcurl -plaintext host.docker.internal:50052 list
grpc.reflection.v1alpha.ServerReflection
routeguide.RouteGuide
$ docker run --rm fullstorydev/grpcurl -d '{"latitude": -460000000, "longitude": -1160000000}' \
    -plaintext host.docker.internal:50052 routeguide.RouteGuide.GetFeature
```
