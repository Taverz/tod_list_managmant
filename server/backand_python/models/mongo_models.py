# from flask_mongoengine import MongoEngine

from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship

from base import Base


class Userw(Base):
    __tablename__ = 'userw'
    
    id = Column(Integer, primary_key=True)
    id_user = Column(String)
    email = Column(String)
    username = Column(String)
    password = Column(String)
    login = Column(String)
    
    def to_json(self):
        return {
            "id": str(self.id),
            "username": self.username,
            "id_user": self.id_user,
            "email": self.email,
            "login": self.login,
            "password": self.password
        }
    
    def __init__(self, id_user, email, username, password, login):
        self.id_user = id_user
        self.email = email
        self.username = username
        self.password = password
        self.login = login
    
        
class Companyw(Base):
    __tablename__ = 'companyw'
    
    id = Column(Integer, primary_key=True)
    id_company = Column(String)
    name = Column(String)

    def to_json(self):
        return {
            "id": str(self.id),
            "id_company": self.id_company,
            "name": self.name
        }

    def __init__(self, id_company, name):
        self.id_company = id_company
        self.name = name

class Todow(Base):
    __tablename__ = 'todow'
    
    id = Column(Integer, primary_key=True)
    id_todo = Column(String)
    id_company = Column(String)
    id_user_creater = Column(String)
    id_user_executor = Column(String)
    name = Column(String)
    description = Column(String)
    datetime_create = Column(String)
    priority_task = Column(String)

    def to_json(self):
        return {
            "id": str(self.id),
            "id_company": self.id_company,
            "id_todo": self.id_todo,
            "id_user_creater": self.id_user_creater,
            "id_user_executor": self.id_user_executor,
            "description": self.description,
            "name": self.name,
            "description": self.description,
            "datetime_create": self.datetime_create,
            "priority_task": self.priority_task
        }

    def __init__(self, id_company, name, id_todo, id_user_creater,id_user_executor,description, datetime_create, priority_task):
        self.id_company = id_company
        self.id_todo = id_todo
        self.id_user_creater = id_user_creater
        self.id_user_executor = id_user_executor
        self.name = name
        self.description = description
        self.datetime_create = datetime_create
        self.priority_task = priority_task
        

#     # db.StringField()
#     id_todo = db.StringField(required=True)
#     id_company = db.StringField(required=True)
#     id_user_creater = db.StringField()
#     id_user_executor = db.StringField()
#     name = db.StringField()
#     description = db.StringField()
#     datetime_create = db.StringField()
#     priority_task = db.StringField()


# db = MongoEngine()
# https://flask.palletsprojects.com/en/1.1.x/patterns/mongoengine/


# class Userw(db.Document):  #DynamicDocument
#     meta = {
#         'db_alias': 'userw',
#         'collection': 'userw1'
#     }
#     id_user = db.StringField()
#     email = db.StringField()
#     username = db.StringField()
#     password = db.StringField()
#     login = db.StringField()

#     def to_json(self):
#         return {
#             "_id": str(self.pk),
#             "username": self.username,
#             "id_user": self.id_user,
#             "email": self.email,
#             "login": self.login,
#             "password": self.password
#         }



# class Companyw(db.Document):  #DynamicDocument
#     meta = {
#         'db_alias': 'companyw',
#         'collection': 'companyw1'
#     }

#     # db.StringField()
#     id_company = db.StringField(required=True)
#     name = db.StringField(required=True)


#     def to_json(self):
#         return {
#             "_id": str(self.pk),
#             "id_company": self.id_company,
#             "name": self.name
#         }

# class Todow(db.Document):  #DynamicDocument
#     meta = {
#         'db_alias': 'todow',
#         'collection': 'todow1'
#     }

#     # db.StringField()
#     id_todo = db.StringField(required=True)
#     id_company = db.StringField(required=True)
#     id_user_creater = db.StringField()
#     id_user_executor = db.StringField()
#     name = db.StringField()
#     description = db.StringField()
#     datetime_create = db.StringField()
#     priority_task = db.StringField()

#     def to_json(self):
#         return {
#             "_id": str(self.pk),
#             "id_company": self.id_company,
#             "id_todo": self.id_todo,
#             "id_user_creater": self.id_user_creater,
#             "id_user_executor": self.id_user_executor,
#             "description": self.description,
#             "name": self.name,
#             "description": self.description,
#             "datetime_create": self.datetime_create,
#             "priority_task": self.priority_task
#         }




