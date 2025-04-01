# I. Практика

## pymongo-api

1. **Запуск docker-compose**:
   ```bash
   docker-compose up -d

2. **Подключение к БД**:

   ```bash
   docker exec -T mongodb mongosh

3. **Инициализация БД**:

   ```bash
   use somedb;
   for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
    
4. **Открыть в браузере**:

http://localhost:8080/helloDoc/users

# II. Схема
https://drive.google.com/file/d/1ELOKZpuVxH4WKBUKmHo3X6D05SSijMmd/view?usp=sharing
