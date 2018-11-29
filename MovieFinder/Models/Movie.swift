//
//  Movie.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

struct Movie: Codable {
    
    let name: String?
    let imageURLString: String?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "title"
        case imageURLString = "poster_path"
        case description = "overview"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        imageURLString = try container.decodeIfPresent(String.self, forKey: .imageURLString)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
