# Настройка репликации

1. **Запуск docker-compose**:
   ```bash
   docker-compose up -d

2. **Подключение к конфигурационному серверу**:

   ```bash
   docker exec -it configSrv mongosh --port 27017

3. **Инициализация конфигурационного сервера**:

   ```bash
   rs.initiate({
      _id: "config_replica_set",
      members: [{_id: 0, host: "configSrv:27017"}],
      configsvr: true
    });

4. **Подключение к шарду 1**:
   
   ```bash
   docker exec -it shard1 mongosh --port 27018

5. **Инициализация шарда 1**:

   ```bash
   rs.initiate({_id: "shard1", members: [{_id: 0, host: "shard1:27018"}], version: 1});

6. **Подключение к шарду 2**:
   
   ```bash
   docker exec -it shard2 mongosh --port 27019

7. **Инициализация шарда 2**:
   
   ```bash
   rs.initiate({_id: "shard2", members: [{_id: 0, host: "shard2:27019"}], version: 1});

8. **Подключение к роутеру**:

   ```bash
   docker exec -it mongos_router mongosh --port 27020

9.  **Добавление шардов в кластер**:

   ```bash
   sh.addShard("shard1/shard1:27018");
   sh.addShard("shard2/shard2:27019");

10. **Включение шардирования БД**:

   ```bash
   sh.enableSharding("somedb");
   sh.shardCollection("somedb.helloDoc", {"_id": "hashed"});

11. **Проверка статуса шардирования**:

   ```bash
   sh.status();