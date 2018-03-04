
//  ViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var count = 0
    let recipeNames = ["Chicken", "Steak", "Pork", "Ramen", "Sushi"]
    let cookingTimes = ["45", "45", "35", "30", "25"]
    let recipeImages = [#imageLiteral(resourceName: "chicken.jpg"), #imageLiteral(resourceName: "steak.jpg"), #imageLiteral(resourceName: "pork.jpg"), #imageLiteral(resourceName: "ramen.jpg"), #imageLiteral(resourceName: "sushi.jpg")]
    let recipeRatings = ["3", "3.5", "4", "4.5", "5"]
    let cookNames = ["Jonathan", "Bryan", "Ray", "Kelly", "Chris"]
    var selectedRow = 0
    var name = ""
    
    
    @IBOutlet weak var profileView: UIImageView!
    
    
    @IBOutlet weak var mealHistoryTableView: UITableView!

    @IBAction func addNewRecipe(_ sender: Any) {
        performSegue(withIdentifier: "startToUploadSegue", sender: Any?.self)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mealHistoryTableView.delegate = self
        mealHistoryTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bigz") as! RecipeTableViewCell
        cell.recipeName.text = recipeNames[count]
        cell.timeLabel.text = cookingTimes[count] + "\n mins"
        cell.recipeImage.image = recipeImages[count]
        cell.recipeRating.text = recipeRatings[count]
        cell.cookName.text = "Recipe submitted by \n" + cookNames[count] 
        count = count + 1
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectedRow = indexPath.row
        performSegue(withIdentifier: "startToRecipeSegue", sender: Any?.self)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "startToRecipeSegue"),
//
//            let destination = segue.destination as? RecipeDetailsViewController
//        {
//
//
//            destination.name = recipeNames[selectedRow]
//        }
//        if (segue.identifier == "startToUploadSegue"),
//            let destination = segue.destination as? NewRecipeViewController
//        {
//        }
//    }
//
//     @IBAction func myUnwindActionNewRecipeToMain(unwindSegue: UIStoryboardSegue) {}
//
//     @IBAction func myUnwindActionDetailViewToMain(unwindSegue: UIStoryboardSegue) {}
//
//     @IBAction func myUnwindActionInstructionViewToMain(unwindSegue: UIStoryboardSegue) {}

}


