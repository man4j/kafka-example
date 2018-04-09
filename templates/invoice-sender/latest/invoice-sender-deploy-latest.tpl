<@requirement.CONFORMS>
  <@swarm.SERVICE 'invoice-sender-${namespace}' 'man4j/invoice-sender:${branch}-${commit}'>
    <@service.NETWORK 'kafka-net-${namespace}' />
    <@service.ENV 'brokerList' 'kafka-1-${namespace}:9092' />
  </@swarm.SERVICE>
  
  <@docker.HTTP_CHECKER 'sender-checker-${namespace}' 'http://invoice-sender-${namespace}:8080' 'kafka-net-${namespace}' />
</@requirement.CONFORMS>
