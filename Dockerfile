FROM golang:1.11-alpine3.9 
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLE=0 GOOS=linux go build -o vault-init -v .

FROM alpine:3.9
COPY --from=0 /go/src/app/vault-init .
ENTRYPOINT ["/vault-init"]
