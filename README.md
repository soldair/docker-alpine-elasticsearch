# alpine-elasticsearch

based on [mini-elasticsearch](https://github.com/luislavena/dockerfiles/tree/master/mini-elasticsearch) by luislavena

A very lightweight [Elasticsearch](http://www.elasticsearch.org/) service container.

Updated for coreos

## Usage

To run this container and bind port `9200`:

```
docker run -d -p 9200:9200 luislavena/mini-elasticsearch
```

Note that port `9300` (tcp) is also exposed, but is not required unless you
want to build a multi-node cluster using this container :wink:

You can now check the logs:

```
docker logs <CONTAINER_ID>
```

### Data and volumes

This container exposes `/var/lib/elasticsearch` as bind mount volume. You can
mount it when starting the container:

```
docker run -v /mydata/elasticsearch:/var/lib/elasticsearch -d -p 9200:9200 luislavena/mini-elasticsearch
```

We recommend you mount the volume to avoid loosing data between updates to this
container.

## License

ISC
