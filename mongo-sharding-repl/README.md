# Настройка репликации

1. **Запуск docker-compose**:
   ```bash
   docker-compose up -d

2. **Подключение к конфигурационному серверу**:

   ```bash
   docker exec -it configSrv mongosh --port 27017

3. **Инициализация конфигурационного сервера**:

   ```bash
   rs.initiate(
    {
      _id : "config_server",
      configsvr: true,
      members: [
        { _id : 0, host : "173.17.0.10:27017" }
      ]
    }
  );

4. **Проверка статуса конфигурационного сервера**: 
   
   ```bash
   rs.status();
   exit();


5. **Подключение к шарду 1**:

   ```bash
   docker exec -it shard1_1 mongosh --port 27018

6. **Инициализация шарда 1**:

   ```bash
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

7. **Подключение к шарду 2**:

   ```bash
   docker exec -it shard2_1 mongosh --port 27022
   

8. **Инициализация шарда 2**:

   ```bash
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

9. **Подключение к mongos_router**:

   ```bash
   docker exec -it mongos_router mongosh --port 27020

10.  **Добавление шардов в кластер**:

   ```bash
   sh.addShard("shard1/173.17.0.9:27018,173.17.0.8:27019,173.17.0.5:27021");
   sh.addShard("shard2/173.17.0.4:27022,173.17.0.3:27023,173.17.0.2:27024");

11. **Включение шардирования БД**:

   ```bash
   sh.enableSharding("somedb");
   sh.shardCollection("somedb.helloDoc", {"_id": "hashed"});

12. **Проверка результата**:

   ```bash
   use somedb;
   for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i});
   db.helloDoc.countDocuments() 