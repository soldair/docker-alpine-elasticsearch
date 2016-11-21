FROM alpine:latest
LABEL authors="Ryan day <soldair@gmail.com>,steven brezina <steveinatorx@gmail.com>"

RUN apk update

RUN apk add ca-certificates curl bash sudo

RUN apk add openjdk8-jre

ENV ELASTICSEARCH_VERSION 5.0.1

RUN \
  mkdir -p /opt && \
  cd /tmp && \

  curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz > elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch

#RUN ls -lart /opt/elasticsearch/bin/elasticsearch

ADD ./elasticsearch.yml /var/lib/elasticsearch/config/
#ADD ./elasticsearch.yml /opts/elasticsearch/config/
ADD ./start.sh /start.sh

#es waint let us run as root by default
RUN adduser -D -u 1001 esrunner
RUN chown -R esrunner /var/lib/elasticsearch
RUN chown -R esrunner /opt/elasticsearch

#mount this volume locally if you want to persist your data
VOLUME ["/var/lib/elasticsearch"]

EXPOSE 9200
EXPOSE 9300
CMD ["/start.sh"]
