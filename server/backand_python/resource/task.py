
from flask_restful import Resource
from flask import request
from models import db, User, Words, JP_Words
from mongoengine import connect
from mongoengine.connection import disconnect
import random
import string
import json

class Task(Resource):

    def post(self):
        header = "ds24"#request.headers["Authorization"]
        json_data = request.get_json(force=True)

        return {"Messege" : "No user with that api key"}, 402


    def get(self):
        json_data = request.get_json(force=True)

        db.disconnect_all()
        db.connect(db='todo_list_manager',host='localhost:27017',alias='todo_list_manager')
        print("\n\n\nn\nERROR\n\\n\n\n")

        return {"status": 'success',"data":{"title":"tetle"} }, 201  
