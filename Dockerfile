FROM elasticsearch:7.4.2

ENV discovery.type="single-node"

ENV http.port=9200

EXPOSE 9200/tcp
