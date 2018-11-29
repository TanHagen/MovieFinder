//
//  FavoritesTransceiver.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

protocol FavoritesTransceiver: class {
    
    func addMovieToFavorite(fromCell cell: UITableViewCell)
    
}
