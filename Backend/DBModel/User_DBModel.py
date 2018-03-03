import json
from flaskapp import db, app
from sqlalchemy.dialects.postgresql import JSON
from flask import request, Response, send_file, send_from_directory

class User_DBModel(db.Model):
	__tablename__ = 'users'
	id = db.Column(db.Text, primary_key = True)

	def __init__(self, id):
		self.id = id