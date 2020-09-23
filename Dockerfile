FROM registry.datacommand.co.kr/node-exporter:v1.0.1

ENV NODE_ID ""
ENV NODE_NAME ""

USER root

COPY entrypoint.sh /

ENTRYPOINT  [ "/entrypoint.sh" ]