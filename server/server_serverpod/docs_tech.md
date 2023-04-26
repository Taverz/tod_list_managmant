## Создание и запуск проекта

## Минимальное количество действий для запуска

### Windows powershell

```powershell  
    serverpod create my_app_serverpod22  
    
    cd .\my_app_serverpod22\my_app_serverpod22_server\  
    
    serverpod generate  
    serverpod generate --watch  
    
    docker-compose up -d --build  
    
    .\setup-tables.cmd  
    
    docker compose up --build --detach  
    
    dart bin/main.dart ( dart .\bin\main.dart )  
```  


All done!
You can find general documentation for Flutter at: https://docs.flutter.dev/
Detailed API documentation is available at: https://api.flutter.dev/
If you prefer video documentation, consider: https://www.youtube.com/c/flutterdev

In order to run your application, type:

  $ cd .
  $ flutter run

Your application code is in .\lib\main.dart.


Cleaning up


====================
SERVERPOD CREATED :D
====================

All setup. You are ready to rock!

Start your Serverpod by running:

  $ cd .\server_serverpod\server_serverpod_server\
  $ .\setup-tables.cmd
  $ docker compose up --build --detach
  $ dart .\bin\main.dart

## Если возникла проблема [Failed to connect to database]

```
 Failed to connect to database.  
PostgreSQLSeverity.error 42P01: relation "serverpod_runtime_settings" does not exist
```
Это значит что не выполненно действия по созддания таблицы, а именно:  
1. serverpod generate  
2. .\setup-tables.cmd 
3. docker compose up --build --detach 

1 - Это создание файлов таблицы
2 - создание самой таблицы
3 - обновляем докер базы данных


## Если возникла проблема с поратами PORT (например 8080 )

Это ошибка означает что 
1. Некоторые порты либо повторяются
2. Либо не совпадают с ддокером
3. Либо что то дургое

Проблема 1  решаеться изменением в фале  config/<StaTus>.yaml (config/development.yaml) изменением port параметра



## Для создания твблицы нужно 

1. lib/src/protocol/<tableName>.yaml - добавить параметр table:<tableName>   
2. lib/src/generated/<tableName>.yaml - сгенерировать  
3. .\setup-tables.cmd - запустить  


## ERRORE 1
SERVERPOD version: 1.1.0, dart: 2.19.5 (stable) (Mon Mar 20 17:09:37 2023 +0000) on "windows_x64", time: 2023-04-25 21:11:53.988464Z
mode: development, role: monolith, logging: normal, serverId: default
Failed to connect to the database. Retrying in 10 seconds. PostgreSQLSeverity.error 42P01: relation "serverpod_runtime_settings" does not exist 
Database configuration:
database host: localhost
database port: 8090
database name: rrr
database user: postgres
database require SSL: false
database unix socket: false
database pass: ********

Failed to connect to the database. Retrying in 10 seconds. PostgreSQLSeverity.error 42P01: relation "serverpod_runtime_settings" does not exist 
Failed to connect to the database. Retrying in 10 seconds. PostgreSQLSeverity.error 42P01: relation "serverpod_runtime_settings" does not exist 


## Fix Errore 1
delete in file protocol/example.yaml table:example line



