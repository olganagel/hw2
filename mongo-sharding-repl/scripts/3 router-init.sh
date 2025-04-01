#!/bin/bash

# Инцициализация монгос роутера и добавление тестовых данных
docker exec -it mongos_router mongosh --port 27020 <<EOF
sh.addShard("shard1/173.17.0.9:27018,173.17.0.8:27019,173.17.0.5:27021");
sh.addShard("shard2/173.17.0.4:27022,173.17.0.3:27023,173.17.0.2:27024");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", {"name": "hashed"});

use somedb;
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i});

db.helloDoc.countDocuments();
exit();
EOF