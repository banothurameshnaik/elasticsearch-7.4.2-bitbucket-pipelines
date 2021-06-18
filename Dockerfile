FROM elasticsearch:7.4.2

ENV discovery.type="single-node"

ENV ELASTIC_CONTAINER=true

ENV ES_JAVA_OPTS='-Xms512m -Xmx512m'

EXPOSE 9200/tcp
