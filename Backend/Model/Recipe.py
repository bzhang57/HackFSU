import json
import uuid
import datetime

from flaskapp import db, app
from flask import request, Response, send_file, send_from_directory, make_response, session

from sqlalchemy.dialects.postgresql import JSON
from sqlalchemy import or_
from DBModel.Recipe_DBModel import Recipe_DBModel

class Recipe():

	@staticmethod
	def add_recipe():
		id = str(uuid.uuid4())
		parsed_json = request.get_json()
		name = parsed_json['name']
		created_by = parsed_json['created_by']
		# date_created = datetime.datetime.now()
		date_created = parsed_json['date_created']
		ingredients = parsed_json['ingredients']
		directions = parsed_json['directions']
		tags = parsed_json['tags']
		likes = 0
		recipe = Recipe_DBModel(id, name, created_by, date_created, ingredients, directions, tags, likes)
		db.session.add(recipe)
		db.session.commit()
		dict_local = {"recipe_id" : id, "code" : 200}
		return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
		return return_string

	def get_recipe_details():
		parsed_json = request.get_json()
		recipe_id = parsed_json['recipe_id']
		print(recipe_id)
		recipe = Recipe_DBModel.query.filter(Recipe_DBModel.id == recipe_id).first()
		if (recipe == None):
			dict_local = {"code" : 31, "message" : "recipe not found"}
			return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
			return return_string
		dict_local = {}
		dict_local['id'] = recipe.id
		dict_local['ingredients'] = recipe.ingredients
		dict_local['directions'] = recipe.directions
		return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
		return return_string

	# def get_tagged_recipes():
	# 	parsed_json = request.get_json()
	# 	tag = parsed_json["tag"]
	# 	recipes = Recipe_DBModel.query.filter(Recipe_DBModel.ta)

	# def like_recipe():
	# 	parsed_json = request.get_json()
	# 	recipe_id = parsed_json['recipe_id']
	# 	recipe = Recipe.DBModel.query.filter(Recipe.DBModel.id = recipe_id).first()
	# 	if (recipe == None):
	# 		dict_local = {"code" : 31, "message" : "recipe not found"}
	# 		return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
	# 		return return_string
		





app.add_url_rule('/add_recipe', 'add_recipe', Recipe.add_recipe, methods=['POST'])
app.add_url_rule('/get_recipe_details', 'get_recipe_details', Recipe.get_recipe_details, methods=['POST'])
app.add_url_rule('/get_all_recipes', 'add_recipe', Recipe.add_recipe, methods=['POST'])



