# webui-aria2-docker

# Info

- `/jsonrpc`
- `/data`
- `/`

# Docker
```
docker run -d --restart always --name aria2 -p 5555:5555 lukasmrtvy/docker-aria2-webui:latest
```

# Variables
- SKIP_SSL
- RUN_USER
- RUN_GROUP
- RUN_GROUP_ID
- RUN_USER_ID
- RPC_TOKEN

# Traefik
```
docker run -d 
  --restart always 
  --name aria2 
  --network traefik-network
  --label "traefik.enable=true" 
  --label "traefik.basic.frontend.rule=Host:aria2.htpc.io" 
  --label "traefik.basic.port=5555" 
  lukasmrtvy/docker-aria2-webui:latest
```
