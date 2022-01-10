//
//  SearchResultsViewController.swift
//  TheStocksApp
//
//  Created by Richard Price on 18/08/2021.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidSelect(searchResult: SearchResult)
}


class SearchResultsViewController: ViewController {

    weak var delegate: SearchResultsViewControllerDelegate?
    private var results: [SearchResult] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: String(describing: SearchResultsTableViewCell.self))
        //step 14
        tableView.isHidden = true
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupTableView()
       
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    //step 12 update string to saerch results
    public func update(with results: [SearchResult]) {
        self.results = results
        //step 15
        tableView.isHidden = results.isEmpty
        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchResultsTableViewCell.self), for: indexPath)
        let modelResult = results[indexPath.row]
        cell.textLabel?.text = modelResult.displaySymbol
        cell.detailTextLabel?.text = modelResult.description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modelResult = results[indexPath.row]
        delegate?.searchResultsViewControllerDidSelect(searchResult: modelResult)
        
    }
    
}
