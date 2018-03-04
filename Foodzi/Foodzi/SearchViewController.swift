//
//  SearchViewController.swift
//  Foodzi
//
//  Created by Kelly Chen on 3/3/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var categories = ["Italian", "Chinese", "Vegetarian", "Gluten-Free", "Quick", "Vegan"]
    var trendingRecipes = ["Red", "Blue", "Green"]
    var count = -1
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingRecipes.count + 1
    }
    
    // let cellTrending = tableView.dequeueReusableCell(withIdentifier: "kell") as! SearchTableViewCell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (count == -1) {
            print("This runs")
            let cellTrendingRecipes = tableView.dequeueReusableCell(withIdentifier: "kell") as! KellTableViewCell
            count = count + 1
            cellTrendingRecipes.trendingSearch.text = "Trending Searches:"
            return cellTrendingRecipes
        } else {
            let cellTrendingRecipes = tableView.dequeueReusableCell(withIdentifier: "jon") as! SearchTableViewCell
            cellTrendingRecipes.trendingRecipe.text = trendingRecipes[count]
            count = count + 1
            return cellTrendingRecipes
        }
    }
    
    

}
