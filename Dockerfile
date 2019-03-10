FROM golang:alpine as builder
RUN apk add --no-cache git
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go get -d -v github.com/prometheus/prometheus/documentation/examples/remote_storage/remote_storage_adapter
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v github.com/prometheus/prometheus/documentation/examples/remote_storage/remote_storage_adapter
# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/remote_storage_adapter

FROM scratch
COPY --from=builder /go/remote_storage_adapter /bin/remote_storage_adapter
ENTRYPOINT ["/bin/remote_storage_adapter"]
