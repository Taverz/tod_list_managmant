from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow

from flask_mongoengine import MongoEngine
# from flask_pymongo import PyMongo 
from pymongo import MongoClient
from pymongo import errors
# from mongoengine import *

ma = Marshmallow()
# db =  PyMongo() # SQLAlchemy()
# db = PyMongo()
db = MongoEngine()
# https://flask.palletsprojects.com/en/1.1.x/patterns/mongoengine/

# moc = MongoClient()
# moc2 = moc['user']
# db = moc2['user1']

class User(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'user',
        'collection': 'user1'
    }
    # meta = {'collection': 'users', 'allow_inheritance': False, '_target_db': 'some_target_database'}
    # id = db.ObjectIdField()
    username = db.StringField() #(required=True)
    password = db.StringField()
    login = db.StringField()
    # lastname = db.StringField()
    # emailadress = db.StringField()
    # api_key = db.StringField()
    def to_json(self):
        return {
            "_id": str(self.pk),
            "username": self.username,
            "password": self.password
        }

# moc = MongoClient()
# moc2 = moc['user']
# db = moc2['user1']


class Words(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'test1',
        'collection': 'wer'
    }
    num = db.StringField(required=True)
    words = db.StringField()
    meaning = db.StringField()
    topword = db.StringField()
    topwordtext  = db.StringField()
    tip  = db.StringField()
    nlevel  = db.StringField()
    exemple   = db.StringField()

    def to_json(self):
        return {
            "_id": str(self.pk),
            "num": self.num,
            "words": self.words,
            "meaning": self.meaning,
            "topword": self.topword,
            "topwordtext": self.topwordtext,
            "tip": self.tip,
            "nlevel": self.nlevel,
            "exemple": self.exemple
        }


class JP_GramTab(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'jp',
        'collection': 'grammartab'
    }
    gram = db.StringField()
    jlpt = db.IntField()

    def to_json(self):
        return {
            "_id": str(self.pk),
            "gram": self.gram,
            "jlpt": self.jlpt 
        
        }

class JP_Kanji(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'jp',
        'collection': 'kanji'
    }
    top = db.IntField()
    jlpt = db.IntField()
    pronunciation = db.StringField()
    meaning = db.StringField()
    kanji = db.StringField()

    def to_json(self):
        return {
            "_id": str(self.pk),
            "top": self.top,
            "pronunciation": self.pronunciation,
            "meaning": self.meaning,
            "kanji": self.kanji,
            "jlpt": self.jlpt 
        
        } 

class JP_Words(db.Document):  #DynamicDocument
    meta = {
        'db_alias': 'jp',
        'collection': 'words',
        'strict': False  # игнорирование ошибки с дополнитеььлными полями # To ignore this error when there are extra fields when loading data 
    }
    top = db.IntField()
    jlpt = db.IntField()
    
    vocab_expression = db.StringField()
    vocab_kana = db.StringField()
    vocab_meaning = db.StringField()
    vocab_pos = db.StringField()
    # sentence_expression = db.StringField()
    sentence_meaning = db.StringField()
    # sentence_kana = db.StringField()
    # sound = db.StringField()
    

    def to_json(self):
        return {
            "_id": str(self.pk),
            "top": self.top,

            "vocab_expression": self.vocab_expression,
            "vocab_kana": self.vocab_kana,
            "vocab_meaning": self.vocab_meaning,
            "vocab_pos": self.vocab_pos, # None, Verb

            # "sentence_expression": self.sentence_expression,
            "sentence_meaning": self.sentence_meaning,
            # "sentence_kana": self.sentence_kana,
            # "vocab_sound_local": self.sound,

            "jlpt": self.jlpt 
        
        }


