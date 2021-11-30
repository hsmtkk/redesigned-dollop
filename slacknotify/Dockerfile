FROM golang:1.17 AS builder

WORKDIR /opt

COPY . .

WORKDIR /opt/printname

RUN go build

FROM gcr.io/distroless/cc-debian11 AS runtime

COPY --from=builder /opt/slacknotify /usr/local/bin/slacknotify

ENTRYPOINT ["/usr/local/bin/slacknotify"]
