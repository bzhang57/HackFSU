//
//  AddIngredientsViewController.swift
//  Foodzi
//
//  Created by Raymond Zhang on 3/3/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class AddIngredientsViewController: UIViewController {

    @IBOutlet weak var ingredient: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addIngredient(_ sender: Any) {
        performSegue(withIdentifier: "addIngredientToDetails", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addIngredientToDetails"),
            
            let destination = segue.destination as? RecipeDetailsViewController
        {
            
            
            destination.ingredients.append(amount.text! + " " + ingredient.text!)
        }
    }

}
