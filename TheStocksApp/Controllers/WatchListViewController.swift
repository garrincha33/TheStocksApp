//
//  WatchListViewController.swift
//  TheStocksApp
//
//  Created by Richard Price on 16/08/2021.
//

import UIKit

class WatchListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
    }
    //step 1 create a function to hold search controller
    private func setupSearchController() {
        let resultViewController = SearchResultsViewController()
        let searchViewController = UISearchController(searchResultsController: resultViewController)
        searchViewController.searchResultsUpdater = self //we can get user taps
        navigationItem.searchController = searchViewController
    }
    
}
//step 2 extend watchlistcontroller with searchresults updating
extension WatchListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsViewController =  searchController.searchResultsController as? SearchResultsViewController,
                  !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        //call api here to search here
        
        //optimise search when user stops typing and
        
        //update results controller
        print(query)
    }
}
