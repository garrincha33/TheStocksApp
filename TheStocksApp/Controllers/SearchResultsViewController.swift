//
//  SearchResultsViewController.swift
//  TheStocksApp
//
//  Created by Richard Price on 18/08/2021.
//

import UIKit

//step 6 create a protocol to proxy back and use didSelect
//this is so 2 different controllers can commiuncate
protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidSelect(searchResult: String)
}


class SearchResultsViewController: ViewController {
    
    //step 7 create a reference to your delegate
    weak var delegate: SearchResultsViewControllerDelegate?
    //step 9
    private var results: [String] = []

    //step 2 create tableVIew, using a closure pattern which
    //just alllows us to return a tableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        //register cell
        tableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: String(describing: SearchResultsTableViewCell.self))
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupTableView()
       
    }
    
    private func setupTableView() {
        //step 3 create a function for setting tableview
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    //step 10 create an update function to update results
    public func update(with results: [String]) {
        self.results = results
        tableView.reloadData()
    }
    
    
    //step 5 match the bounds of the tableview
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
}
//step 4 extension for tableivew delegate functions
extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchResultsTableViewCell.self), for: indexPath)
        cell.textLabel?.text = "APPL"
        cell.detailTextLabel?.text = "apple INC"
        return cell
    }
    //step 8 CONFORM lets deselect the select and pass the delegate back
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.searchResultsViewControllerDidSelect(searchResult: "ApApAp")
        
    }
    
}
