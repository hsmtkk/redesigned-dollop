FROM golang:1.17 AS builder

WORKDIR /opt

COPY . .

WORKDIR /opt/printext

RUN go build

FROM gcr.io/distroless/cc-debian11 AS runtime

COPY --from=builder /opt/printext /usr/local/bin/printext

ENTRYPOINT ["/usr/local/bin/printext"]
