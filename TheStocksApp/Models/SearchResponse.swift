//
//  SearchResponse.swift
//  TheStocksApp
//
//  Created by Richard Price on 10/01/2022.
//

import Foundation
//step 9 create 2 structs for the model to capture the reponse
struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResult]
}
struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}


