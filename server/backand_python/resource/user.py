
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

class User(Resource):

    def post(self):
        header = "ds24"#request.headers["Authorization"]
        json_data = request.get_json(force=True)
        
        addDatabaseUser(Userw("id_user", 'email', "username", "password", "login"))

        return {"Messege" : "No user with that api key"}, 402


    def get(self):
        json_data = request.get_json(force=True)

        # db.disconnect_all()
        # db.connect(db='todo_list_manager',host='localhost:27017',alias='todo_list_manager')
        # print("\n\n\nn\nERROR\n\\n\n\n")
        
        users = []
        users = getAllUsers()

        return {"status": 'success',"data":{"users":users} }, 201  






def addDatabaseUser(dataUser: Userw):
    
    # 2 - generate database schema
    Base.metadata.create_all(engine)
    # 3 - create a new session
    session = Session()
    # 8 - create stuntmen
    user = Userw("id_user", 'email', "username", "password", "login") # dataUser
    session.add(user)
    # 10 - commit and close session
    session.commit()
    session.close()

### ------
def getAllUsers():
    # 2 - extract a session
    session = Session()

    # 3 - extract all movies
    users = session.query(Userw).all()
    user = []

    # 4 - print movies' details
    print('\n### All Userw:')
    for usersone in users:
        user.append(usersone)
        print(f'{usersone.name()} ')
    print('')
    # 10 - commit and close session
    session.commit()
    session.close()
    
    
    return user