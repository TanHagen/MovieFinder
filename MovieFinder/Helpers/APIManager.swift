//
//  APIManager.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import Foundation

final class APIManager {
    
    typealias ResultCompletionHandler = (Result) -> Void
    
    private init() {}
    
    static var requestString: String!
    
    static func sendRequest(with requestString: String) {
        self.requestString = requestString
    }
    
    static func getData(from url: URL, withCompletionHandler completionHandler: @escaping ResultCompletionHandler) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,error == nil, let json = JSONManager.fetchJSON(from: data, ofType: Result.self) else { return }
            completionHandler(json)
        }.resume()
    }
}

