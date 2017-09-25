//
//  Search.swift
//  NewsApp
//
//  Created by macosx on 16.07.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit

class Search: UITableViewController, UISearchResultsUpdating {
    
    var newsSearch = ["News","Sport","Politic","Art","Music"]
    var filteredNews = [String]()
    var searchController: UISearchController!
    var resultController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultController.tableView.delegate = self
        self.resultController.tableView.dataSource = self
        
        self.searchController = UISearchController(searchResultsController: self.resultController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        
    
        
    }

    func updateSearchResults(for searchController: UISearchController) {
       self.filteredNews = self.newsSearch.filter { (news:String) -> Bool in
        if news.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
            return true
        }else {
            return false
         }
        
        }
        self.resultController.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
        return self.newsSearch.count
         }else {
            return self.filteredNews.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView {
        cell.textLabel?.text = self.newsSearch[indexPath.row]
         }else {
            cell.textLabel?.text = self.filteredNews[indexPath.row]
         }
        
        return cell
    }
   
}
