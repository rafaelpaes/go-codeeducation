FROM golang:1.14-alpine as builder

WORKDIR /go/src/app
COPY main.go .

RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch

COPY --from=builder /go/src/app/app .
CMD ["/app"]