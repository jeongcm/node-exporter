FROM registry.datacommand.co.kr/node-exporter:v1.0.1

ENV NODE_ID ""
ENV NODE_NAME ""
ENV NODE_IP ""

USER root

CMD ["export", "NODE_IP=$(docker node inspect self --format '{{.Status.Addr}}')"]
COPY entrypoint.sh /

ENTRYPOINT  [ "/entrypoint.sh" ]