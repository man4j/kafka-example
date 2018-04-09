<@requirement.CONFORMS>
  <@docker.REMOVE_HTTP_CHECKER 'processor-checker-${namespace}' />
  <@swarm.SERVICE_RM 'invoice-processor-${namespace}' />
</@requirement.CONFORMS>
