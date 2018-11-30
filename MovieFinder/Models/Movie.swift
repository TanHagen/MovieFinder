//
//  Movie.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

struct Movie: Decodable, Encodable {
    
    let title: String?
    let posterPath: String?
    let overview: String?
    
}
