//
//  NetworkClient.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import Foundation
protocol NetworkClient {
    
    // MARK: - Method Requirements
    func fetchData<T: Decodable>(for: T.Type, url: String) async throws -> T?
}
