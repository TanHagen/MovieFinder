//
//  DataManager.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class DataManager {
    
    let cellIdentifider = "movieCell"
    
    var movies: [Movie] = []
    var favoriteMovies: [Movie] = []
    
    var dataSource: [Movie]! {
        didSet {
            dataSource = movies
        }
    }
}
