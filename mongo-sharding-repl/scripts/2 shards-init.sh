#!/bin/bash

# Инициализация первого шарда
docker exec -it shard1_1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "173.17.0.9:27018" },
        { _id : 1, host : "173.17.0.8:27019" },
        { _id : 2, host : "173.17.0.5:27021" }
      ]
    }
  );
exit();
EOF

# Инициализация второго шарда
docker exec -it shard2_1 mongosh --port 27022 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "173.17.0.4:27022" },
        { _id : 1, host : "173.17.0.3:27023" },
        { _id : 2, host : "173.17.0.2:27024" }
      ]
    }
  );
exit();
EOF