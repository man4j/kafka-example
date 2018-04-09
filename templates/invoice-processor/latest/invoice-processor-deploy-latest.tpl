<@requirement.PARAM name='AUTO_OFFSET_RESET' value='latest' type='select' values='latest,earliest' />

<@requirement.CONFORMS>
  <@swarm.SERVICE 'invoice-processor-${namespace}' 'man4j/invoice-processor:${branch}-${commit}'>
    <@service.SCALABLE />
    <@service.NETWORK 'kafka-net-${namespace}' />
    <@service.ENV 'brokerList' 'kafka-1-${namespace}:9092' />
    <@service.ENV 'autoOffsetReset' PARAMS.AUTO_OFFSET_RESET />
  </@swarm.SERVICE>

  <@docker.HTTP_CHECKER 'processor-checker-${namespace}' 'http://invoice-processor-${namespace}:8080' 'kafka-net-${namespace}' />
</@requirement.CONFORMS>
