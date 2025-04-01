#!/bin/bash

# Проверка количества документов на первом шарде
docker exec -it shard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

# Проверка количества документов на втором шарде
docker exec -it shard2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF