
from flask_restful import Resource
from flask import request
from models import db, User, Words, JP_Words
from mongoengine import connect
from mongoengine.connection import disconnect
import random
import string
import json

class User(Resource):
    print("TextNLPJapan class")

    def post(self):
        header = "ds24"#request.headers["Authorization"]
        json_data = request.get_json(force=True)

        return {"Messege" : "No user with that api key"}, 402


    def get(self):
        result = []
        header = ""
        json_data = request.get_json(force=True)

        #TODO:
        if  header: # if not header: 
            return {"Messege" : "No api key!"}, 400
        else:
            print("\n\n\n\n DOCTOR \n\n\n\n")
            db.disconnect_all()

            # db.disconnect(alias='user') #,username='',password='',authentication_source='admin'

            db.connect(db='jp',host='localhost:27017',alias='jp')

            tabWords = textNLP["tabWords"]
            wordsN = tabWords['Japanese Words']
            print("\n\n\nn\nERROR\n\\n\n\n")
            print("\n\n Jappaese Words\n"+str(wordsN))
            levelWordsJson = {}

            return {"status": 'success',"data":{"tabWords":tabWords, "text":text,"id":id,"title":"tetle"} }, 201  
