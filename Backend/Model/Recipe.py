import json
import uuid
import datetime

from flaskapp import db, app
from flask import request, Response, send_file, send_from_directory, make_response, session

from sqlalchemy.dialects.postgresql import JSON
from sqlalchemy import or_
from DBModel.Recipe_DBModel import Recipe_DBModel
from DBModel.User_DBModel import User_DBModel

class Recipe():

    @staticmethod
    def add_recipe():
        id = str(uuid.uuid4())
        parsed_json = request.get_json()
        name = parsed_json['name']
        created_by = parsed_json['created_by']
        date_created = datetime.datetime.now()
        # date_created = parsed_json['date_created']
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

    @staticmethod
    def delete_recipe():
        parsed_json = request.get_json()
        recipe_id = parsed_json['recipe_id']
        recipe = Recipe_DBModel.query.filter(Recipe_DBModel.id == recipe_id).first()
        if recipe is None:
            dict_local = {'code' : 31, 'message': "recipe not found"}
            return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
            return return_string 
        db.session.delete(recipe)
        db.session.commit()
        dict_local = {'code': 200}
        return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
        return return_string

    @staticmethod
    def get_recipe_details():
        parsed_json = request.get_json()
        recipe_id = parsed_json['recipe_id']
        print(recipe_id)
        recipe = Recipe_DBModel.query.filter(Recipe_DBModel.id == recipe_id).first()
        if recipe is None:
            dict_local = {"code" : 31, "message" : "recipe not found"}
            return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
            return return_string
        dict_local = {}
        dict_local['id'] = recipe.id
        dict_local['name'] = recipe.name
        dict_local['ingredients'] = recipe.ingredients
        dict_local['directions'] = recipe.directions
        dict_local['likes'] = recipe.likes
        dict_local['created_by'] = recipe.created_by
        dict_local['date_created'] = recipe.date_created.isoformat()
        dict_local['tags'] = recipe.tags
        return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
        return return_string

    # def get_tagged_recipes():
    #   parsed_json = request.get_json()
    #   tag = parsed_json["tag"]
    #   recipes = Recipe_DBModel.query.filter(Recipe_DBModel.ta)

    @staticmethod
    def like_recipe():
        parsed_json = request.get_json()
        recipe_id = parsed_json['recipe_id']
        recipe = Recipe_DBModel.query.filter(Recipe_DBModel.id == recipe_id).first()
        if recipe is None:
            dict_local = {"code" : 31, "message" : "recipe not found"}
            return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
            return return_string
        print (recipe.likes)
        recipe.likes = recipe.likes + 1
        print (recipe.likes)
        db.session.add(recipe)
        db.session.commit()
        dict_local = {"recipe_id" : recipe_id, "code" : 200}
        return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
        return return_string

    @staticmethod
    def unlike_recipe():
        parsed_json = request.get_json()
        recipe_id = parsed_json['recipe_id']
        recipe = Recipe_DBModel.query.filter(Recipe_DBModel.id == recipe_id).first()
        if recipe is None:
            dict_local = {"code" : 31, "message" : "recipe not found"}
            return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
            return return_string
        print (recipe.likes)
        recipe.likes = recipe.likes - 1
        print (recipe.likes)
        db.session.add(recipe)
        db.session.commit()
        dict_local = {"recipe_id" : recipe_id, "code" : 200}
        return_string = json.dumps(dict_local, sort_keys=True, indent=4, separators=(',', ': '))
        return return_string





app.add_url_rule('/add_recipe', 'add_recipe', Recipe.add_recipe, methods=['POST'])
app.add_url_rule('/delete_recipe', 'delete_recipe', Recipe.delete_recipe, methods=['POST'])
app.add_url_rule('/get_recipe_details', 'get_recipe_details', Recipe.get_recipe_details, methods=['POST'])
app.add_url_rule('/like_recipe', 'like_recipe', Recipe.like_recipe, methods=['POST'])
app.add_url_rule('/unlike_recipe', 'unlike_recipe', Recipe.unlike_recipe, methods=['POST'])



