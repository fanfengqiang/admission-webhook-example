FROM golang as builder
WORKDIR /app
ADD . ./
RUN GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o admission-webhook-example

FROM alpine:latest
COPY --from=builder /app/admission-webhook-example /admission-webhook-example
ENTRYPOINT ["./admission-webhook-example"]