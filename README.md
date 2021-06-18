# Easticsearch image for Bitbucket Pipelines

Bitbucket pipelines does not allow you to use dot notation in variables. So I created my own elastic search docker image to include the discovery type.

## Version

Elasticsearch 7.4.2

## Hub

<https://hub.docker.com/r/rameshnaik5521/elasticsearch-bitbucket-pipelines>

## Example

```yaml
definitions:
  steps:
    - step: &run-tests
        name: Run tests
        script:
          - sleep 30 # Waiting elasticsearch. In your real pipeline you can not use it.
          - curl -XGET localhost:9250/_cat/health
        services:
          - elasticsearch
  services:
    elasticsearch:
      image: rameshnaik5521/elasticsearch-bitbucket-pipelines
      variables:
        ES_JAVA_OPTS: '-Xms512m -Xmx512m'
    docker:
      memory: 2048

pipelines:
  pull-requests:
    '**':
      - step: *run-tests
```

## Test and build

`docker build -t rameshnaik5521/elasticsearch-bitbucket-pipelines .`

When you commit to the bitbucket repo it will then trigger the image to be rebuilt on dockerhub.

Run the container locally after building.

`docker run -d -p 9200:9200 -p 9300:9300 rameshnaik5521/elasticsearch-bitbucket-pipelines:latest`
