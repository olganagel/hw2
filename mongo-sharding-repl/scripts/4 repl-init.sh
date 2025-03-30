#!/bin/bash

# Инициализация репликации
docker exec -it mongodb1 mongosh <<EOF

> rs.initiate({_id: "rs0", members: [
{_id: 0, host: "mongodb1:27017"},
{_id: 1, host: "mongodb2:27018"},
{_id: 2, host: "mongodb3:27019"}
]}); 
exit();
EOF