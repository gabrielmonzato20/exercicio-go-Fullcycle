FROM golang:alpine as builder

WORKDIR /opt/app/go

COPY main.go /opt/app/go

RUN go build  main.go

FROM scratch AS final

COPY --from=builder /opt/app/go/main /

WORKDIR /

ENTRYPOINT ["/main"]

