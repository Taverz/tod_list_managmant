from flask import Flask
from pymongo import MongoClient
from flask_pymongo import PyMongo 
from flask_mongoengine import MongoEngine
from mongoengine import connect
import socket

import flask.scaffold
flask.helpers._endpoint_from_view_func = flask.scaffold._endpoint_from_view_func
import flask_restful

def create_app(config_filename):
    app = Flask(__name__)
    # app.config.from_object(config_filename)
    app.config["MONGO_URI"] = "mongodb://localhost:27017/"
    # app.config["DB_CLIENT"] = ""
    # app.config["COLLECTION"]= ""
    

   

    # app.config['MONGODB_SETTINGS'] = {
    # 'db': 'project1',
    # 'username':'webapp',
    # 'password':'pwd123'
    # }

    #OR
    # app.config['MONGODB_DB'] = 'project1'
    # app.config['MONGODB_HOST'] = '192.168.1.35'
    # app.config['MONGODB_PORT'] = 12345
    # app.config['MONGODB_USERNAME'] = 'webapp'
    # app.config['MONGODB_PASSWORD'] = 'pwd123'
    
    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    # from models import db
    # db.init_app(app)
    
    # db = PyMongo(app)

    return app

    # from app import api_bp
    # app.register_blueprint(api_bp, url_prefix='/api')

    # from models import db
    # db.init_app(app)

    # return app


if __name__ == "__main__":
    # app = create_app("config")
    # app.run(debug=True)
    app = Flask(__name__)
    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')
    # app.config["MONGO_URI"] = "mongodb://localhost:27017/"
    # app.config["MONGODB_DB"] = 'user'
    # connect(db='user',host='localhost',port=27017,alias='project1') #,username='',password='',authentication_source='admin')
    from models import db
    # connect(
    # 'user',
    # host='localhost',
    # port=27017
    # )
    db.init_app(app)
    # db.connect('user')
    hostname = socket.gethostname()
    local_ip = socket.gethostbyname(hostname)

    print(str(local_ip))

    app.run(
    debug=True,
    host= '192.168.0.229', #'192.168.43.45', #str(local_ip), #'192.168.0.104', #"192.168.0.104", #"192.168.0.102",  # 192.168.0.102  # 0.0.0.0
    port=5040,
        threaded=True,
        processes=1
    )


# from flask import Flask


# def create_app(config_filename):
#     app = Flask(__name__)
#     # app.config.from_pyfile('config_filename')
#     app.config.from_object(config_filename)
    
#     from app import api_bp
#     app.register_blueprint(api_bp, url_prefix='/api')

#     from models import db
#     db.init_app(app)

#     return app


# if __name__ == "__main__":
#     app = create_app("config")
#     app.run(
#     debug=True,
#     host="192.168.0.102",  # 192.168.0.102  # 0.0.0.0
#     port=5000
#     )