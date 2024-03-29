# coding=utf-8
from flask_restful import Resource
from flask import request
from models import Userw, Companyw, Todow
from mongo_models import Userw, Companyw, Todow
from datetime import date

import random
import string
import json

### MongoEngineDB
# from mongoengine import connect
# from mongoengine.connection import disconnect

### Persisting Data with SQLAlchemy ORM
# # 1 - imports
from base import Session, engine, Base
# from sqlalchemy import Column, String, Integer, ForeignKey
# from sqlalchemy.orm import relationship

class Company(Resource):

    def post(self):
        header = "ds24"#request.headers["Authorization"]
        json_data = request.get_json(force=True)
        addDatabaseCompany(Companyw("id_company", "name"))
        return {"Messege" : "No user with that api key"}, 402


    def get(self):
        json_data = request.get_json(force=True)
        
        ## MonogEngineDB
        # db.disconnect_all()
        # db.connect(db='todo_list_manager',host='localhost:27017',alias='todo_list_manager')
        # print("\n\n\nn\nERROR\n\\n\n\n")
        
        ## SQL ORM Alchimes
        companys = getAllCompanyw()

        return {"status": 'success',"data":{"companys":companys} }, 201  






def addDatabaseCompany(dataCompany: Companyw):
    
    # 2 - generate database schema
    Base.metadata.create_all(engine)
    # 3 - create a new session
    session = Session()
    # 8 - create stuntmen
    company = Companyw("id_company", "name") # dataCompany
    session.add(company)
    # 10 - commit and close session
    session.commit()
    session.close()

### ------
def getAllCompanyw():
    # 2 - extract a session
    session = Session()

    # 3 - extract all movies
    companys = session.query(Companyw).all()
    company = []

    # 4 - print movies' details
    print('\n### All Companyw:')
    for companyone in companys:
        company.append(companyone)
        print(f'{companyone.name()} ')
    print('')
    # 10 - commit and close session
    session.commit()
    session.close()
    
    
    return company