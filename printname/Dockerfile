FROM golang:1.17 AS builder

WORKDIR /opt

COPY . .

WORKDIR /opt/printname

RUN go build

FROM gcr.io/distroless/cc-debian11 AS runtime

COPY --from=builder /opt/printname /usr/local/bin/printname

ENTRYPOINT ["/usr/local/bin/printname"]
