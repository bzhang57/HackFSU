//
//  ViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var count = 0
    @IBOutlet weak var mealHistoryTableView: UITableView!
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bigz") as! RecipeTableViewCell
        cell.recipeName.text = "Chicken"
        cell.timeLabel.text = "45 Min"
        cell.recipeImage.image = #imageLiteral(resourceName: "chicken.jpg")
        
        return cell
    }

}

