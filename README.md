# webui-aria2-docker

# Info

- `/jsonrpc`
- `/data`
- `/`

# Docker
```
docker run -d --restart always --name aria2 -p 443:443 lukasmrtvy/docker-aria2-webui:latest
```

# Variables
- SKIP_SSL
- RUN_USER
- RUN_GROUP
- RUN_GROUP_ID
- RUN_USER_ID
- RPC_TOKEN
