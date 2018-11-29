//
//  JSONParser.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import Foundation

final class JSONManager {
    
    static func fetchJSON<T: Decodable>(from data: Data, ofType type: T.Type) -> T? {
        var json: T!
        do {
          json = try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print(error)
        }
        return json
    }
    
    private init() {}
}
