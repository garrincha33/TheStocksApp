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
        setupTitleView()
    
    }
    private func setupSearchController() {
        let resultViewController = SearchResultsViewController()
        let searchViewController = UISearchController(searchResultsController: resultViewController)
        searchViewController.searchResultsUpdater = self //we can get user taps
        navigationItem.searchController = searchViewController
    }
    
    private func setupTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let lable = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width-20, height: titleView.height))
        lable.text = "Stocks"
        lable.font = .systemFont(ofSize: 35, weight: .medium)
        titleView.addSubview(lable)
        navigationItem.titleView = titleView
    }
    
}
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
