from flask import Blueprint
from flask_restful import Api

from resources.User import User
from resources.Task import Task
from resources.Company import Company

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(User, '/register')
api.add_resource(User, '/signin')
api.add_resource(User, '/user_edit')

api.add_resource(Task, '/tasks_company') 
api.add_resource(Task, '/tasks_user') 
api.add_resource(Task, '/task_create') 
api.add_resource(Task, '/task_update')
api.add_resource(Task, '/task_delete')

api.add_resource(Company, '/company_create') 
api.add_resource(Company, '/company_delete') 
api.add_resource(Company, '/company_add_user') 