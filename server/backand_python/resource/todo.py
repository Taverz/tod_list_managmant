
from flask_restful import Resource
from flask import request
from models import Userw, Companyw, Todow
from mongo_models import Userw, Companyw, Todow

# from mongoengine import connect
# from mongoengine.connection import disconnect

### Persisting Data with SQLAlchemy ORM
# # 1 - imports
from base import Session, engine, Base
# from sqlalchemy import Column, String, Integer, ForeignKey
# from sqlalchemy.orm import relationship

import random
import string
import json

class Todow(Resource):

    def post(self):
        header = "ds24"#request.headers["Authorization"]
        json_data = request.get_json(force=True)
        
        addDatabaseTodo(Todow("id_company", "name", "id_todo", "id_user_creater","id_user_executor","description", "datetime_create", "priority_task"))

        return {"Messege" : "No user with that api key"}, 402


    def get(self):
        json_data = request.get_json(force=True)

        # db.disconnect_all()
        # db.connect(db='todo_list_manager',host='localhost:27017',alias='todo_list_manager')
        # print("\n\n\nn\nERROR\n\\n\n\n")
        
        todo = []
        todo = getAllTodow()

        return {"status": 'success',"data":{"todo":todo} }, 201  



def addDatabaseTodo(dataTodo: Todow):
    
    # 2 - generate database schema
    Base.metadata.create_all(engine)
    # 3 - create a new session
    session = Session()
    # 8 - create stuntmen
    todo = Todow("id_company", "name", "id_todo", "id_user_creater","id_user_executor","description", "datetime_create", "priority_task") # dataTodo
    session.add(todo)
    # 10 - commit and close session
    session.commit()
    session.close()

### ------
def getAllTodow():
    # 2 - extract a session
    session = Session()

    # 3 - extract all movies
    todos = session.query(Todow).all()
    todo = []

    # 4 - print movies' details
    print('\n### All Todow:')
    for todoone in todos:
        todo.append(todoone)
        print(f'{todoone.name()} ')
    print('')
    # 10 - commit and close session
    session.commit()
    session.close()
    
    
    return todo