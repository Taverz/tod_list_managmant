from flask import Flask
# from marshmallow import Schema, fields, pre_load, validate
# from flask_marshmallow import Marshmallow

from flask_mongoengine import MongoEngine
# from flask_pymongo import PyMongo 
# from pymongo import MongoClient
# from pymongo import errors
# from mongoengine import *

# ma = Marshmallow()
# db =  PyMongo() # SQLAlchemy()
# db = PyMongo()

db = MongoEngine()
# https://flask.palletsprojects.com/en/1.1.x/patterns/mongoengine/


class Userw(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'userw',
        'collection': 'userw1'
    }
    id_user = db.StringField()
    email = db.StringField()
    username = db.StringField()
    password = db.StringField()
    login = db.StringField()

    def to_json(self):
        return {
            "_id": str(self.pk),
            "username": self.username,
            "id_user": self.id_user,
            "email": self.email,
            "login": self.login,
            "password": self.password
        }



class Companyw(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'companyw',
        'collection': 'companyw1'
    }

    # db.StringField()
    id_company = db.StringField(required=True)
    name = db.StringField(required=True)


    def to_json(self):
        return {
            "_id": str(self.pk),
            "id_company": self.id_company,
            "name": self.name
        }
        
class Todow(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'todow',
        'collection': 'todow1'
    }

    # db.StringField()
    id_todo = db.StringField(required=True)
    id_company = db.StringField(required=True)
    id_user_creater = db.StringField()
    id_user_executor = db.StringField()
    name = db.StringField()
    description = db.StringField()
    datetime_create = db.StringField()
    priority_task = db.StringField()

    def to_json(self):
        return {
            "_id": str(self.pk),
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




