FROM elasticsearch:7.4.2

ENV discovery.type="single-node"

ENV http.port=9250

EXPOSE 9250/tcp
