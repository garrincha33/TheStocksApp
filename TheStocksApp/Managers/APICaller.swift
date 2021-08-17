//
//  APICaller.swift
//  TheStocksApp
//
//  Created by Richard Price on 17/08/2021.
//

import Foundation

//step 1 create  api caller with some marks on what we needed
final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let key = ""
        static let sandBoxApiKey = ""
        static let baseUrl = ""
    }
    
    private init() {}
    
    //MARK:- Public

    //get stock info
    //search stocks
    
    //MARK:- Private
    //step 2 create endpoint search, and custom error
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case invalidUrl
        case noDataReturned
    }
    
    //step 3 create a url request function with queryParams
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        return nil
    }
    
    //step 4 create a request generic using codeable
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        //verify not null
        guard let url = url else { return }
        //perform get task
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.invalidUrl))
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(APIError.noDataReturned))
            }
        }
        task.resume()
    }
}
