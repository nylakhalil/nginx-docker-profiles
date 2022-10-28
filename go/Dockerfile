FROM golang:1.18-alpine

WORKDIR /usr/src/app

COPY main.go go.mod ./

RUN go build -o /app

EXPOSE 3000

CMD ["/app"]
