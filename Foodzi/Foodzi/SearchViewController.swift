//
//  SearchViewController.swift
//  Foodzi
//
//  Created by Kelly Chen on 3/3/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var count = 0
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searches = ["Chinese", "Italian", "Vegetarian", "Vegan", "Gluten Free", "Cheap"]
    var filteredSearches: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
        filteredSearches = searches
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearches.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "kell") as! SearchTableViewCell
//        cell.searches.text = searches[count]
//        count = count + 1
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kell", for: indexPath) as! SearchTableViewCell
        cell.textLabel?.text = filteredSearches[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSearches = searchText.isEmpty ? searches : searches.filter( { (item: String) -> Bool in
//            if searches.contains(searchBar.text!) {
////                searchTableView.reloadData()
//                return true
//            } else {
//                return false
//            }
            //print(item.range(of: searchText, options: .caseInsensitive , range: nil, locale: nil))
            return item.range(of: searchText, options: .caseInsensitive , range: nil, locale: nil) != nil
            
        })
        searchTableView.reloadData()
        //count = 0
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

}
