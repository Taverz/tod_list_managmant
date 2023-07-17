
## Fields table  
  
### User  
id_user  
List<id_company>  
login  
password  
name  
email  
  
### Company  
id_company  
List<id_user>  
name  
  
### Todo  
id_todo  
id_company  
id_user_creater  
id_user_executor  
name  
description  
datetime_create  
priority(importance)_task  


## Action tables  

User:  
- create  = создание пользователя при регистрации или при подгрузки с сервера.
- change  
- delete  = нужно удаление для того чтобы соблюсти все правовые нормы.

Todo:  
- getall  = не жедательно использовать, тасков может быть много и список замусорит всю память.
- getperiod  = лучший вариант подгрузки списка, при скролинге подгружать опредленное количество и не замусоривать память.
- create  = при создании стелефона или подгрузки с сервера
- change  = изменение, по каким либо причинам, поменялся статус ...
- delete  

Company: 
- getall  = не жедательно использовать, тасков может быть много и список замусорит всю память.
- create  = при создании с телефона или подгрузки с сервера
- change  = изменение, по каким либо причинам, поменялся статус ...
- delete  
