FROM quay.io/projectquay/golang:1.20 AS builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o kbot .

FROM alpine:latest
WORKDIR /
COPY --from=builder /app/kbot .

ENTRYPOINT ["./kbot"]