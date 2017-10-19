# Curator inside docker container

By default, container removes old indices from elasticsearch.

Run it with:

```sh
docker run -d --link other-es-container:elasticsearch slavniyteo/elasticsearch-curator
```

Every 24 hours it will remove all indexes older than 183 days (half of year).

You can cofigure job with next environment variables:

| ENV | Default value | Description |
| LOCAL_ACTiON_FILE | <empty> | If exists, used instead default action_file.yml |
| INTERVAL_IN_HOURS | 24 | Start job period |
| OLDER_THAN_IN_DAYS | 183 | Indeces age theshold |
| CLIENT.HOST | elasticsearch | Elasticsearch host |
| CLIENT.PORT | 9200 | Elasticsearch port |

You can also configure any values from curator.yml. For example, to set `curator.timeout` set ENV `CURATOR.TIMEOUT`. For more details look at config.yml.

