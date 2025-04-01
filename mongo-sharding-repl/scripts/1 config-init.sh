#!/bin/bash

# Подключение к серверу конфигурации и инициализация
docker exec -it configSrv mongosh --port 27017 <<EOF
rs.initiate(
    {
      _id : "config_server",
      configsvr: true,
      members: [
        { _id : 0, host : "173.17.0.10:27017" }
      ]
    }
  );
EOF