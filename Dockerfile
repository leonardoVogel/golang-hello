## Stage 1: Build the application

FROM golang:latest AS builder

WORKDIR /go/src/app

COPY main.go .

RUN go build main.go

## Stage 2: Production

FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app/main .

CMD [ "./main" ]
