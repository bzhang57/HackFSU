//
//  RecipeDetailsViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if (tableView == ingredientTable) {
            count = ingredients.count
        } else {
            count = directions.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if (tableView == self.ingredientTable) {
            cell = IngredientTableViewCell(style: .subtitle, reuseIdentifier: "tableCell")
            cell?.textLabel?.text = ingredients[indexPath.item]
        } else {
            cell = DirectionTableViewCell(style: .subtitle, reuseIdentifier: "tableCell")
            cell?.textLabel?.text = directions[indexPath.item]
        }
        
        return cell!
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    var edit_hidden = true
    var name = ""
    var ingredients = [String]()
    var directions = [String]()
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientTable: IngredientTableView!
    @IBOutlet weak var directionTable: DirectionTableView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var addIngredients: UIButton!
    @IBOutlet weak var addDirections: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var edit: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIngredients.isHidden = true
        addDirections.isHidden = true
        directionTable.dataSource = self
        directionTable.delegate = self
        recipeName.text = name
        ingredientTable.dataSource = self
        ingredientTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func edit(_ sender: Any) {
        if (edit_hidden) {
            addIngredients.isHidden = false
            addDirections.isHidden = false
            edit.setTitle("Done", for: .normal)
            edit_hidden = false
        } else {
            addIngredients.isHidden = true
            addDirections.isHidden = true
            edit.setTitle("Edit", for: .normal)
            edit_hidden = true
        }
    }
    
    @IBAction func addIngredient(_ sender: Any) {
        ingredients.append("1/2 cup salt")
        self.ingredientTable.reloadData()
    }
    
    @IBAction func addDirection(_ sender: Any) {
        directions.append("1. Preheat")
        self.directionTable.reloadData()
    }
    
    @IBAction func startCookingButton(_ sender: Any) {
        performSegue(withIdentifier: "detailsToInstructionsSegue", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailsToInstructionsSegue"),
            
            let destination = segue.destination as? RecipeStepsViewController
            
        {
            destination.nameText = name
            destination.ingredients = ingredients
            destination.directions = directions
        }
    }
}
