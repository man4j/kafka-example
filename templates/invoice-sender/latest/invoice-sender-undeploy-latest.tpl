<@requirement.CONFORMS>
  <@docker.REMOVE_HTTP_CHECKER 'sender-checker-${namespace}' />
  <@swarm.SERVICE_RM 'invoice-sender-${namespace}' />
</@requirement.CONFORMS>
