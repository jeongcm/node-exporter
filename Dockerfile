FROM registry.datacommand.co.kr/golang:1.14 as builder

WORKDIR /build
COPY common .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o registerd cmd/registerd/registerd.go

FROM registry.datacommand.co.kr/node-exporter:v1.0.1

ENV CDM_SERVICE_NAME=cdm-cloud-node-exporter
ENV CDM_SERVICE_ADVERTISE_PORT=9100

COPY --from=builder /build/registerd /bin/
COPY entrypoint.sh /bin/

ENTRYPOINT ["/bin/sh","/bin/entrypoint.sh"]
