import json
from flaskapp import db, app
from sqlalchemy.dialects.postgresql import JSON
from flask import request, Response, send_file, send_from_directory

class Recipe_DBModel(db.Model):
	id = db.Column(db.Text, primary_key = True)
	ingredients = db.Column(db.Text)
	directions = db.Column(db.Text)
	