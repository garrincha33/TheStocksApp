//
//  SearchResultsTableViewCell.swift
//  TheStocksApp
//
//  Created by Richard Price on 06/01/2022.
//

import UIKit
//step 1 create a custom table view cell
class SearchResultsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not using storyboards")
    }
}
