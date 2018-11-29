//
//  MovieCell.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class MovieCell: UITableViewCell, CellConfigurator {
    
    weak var delegate: FavoritesTransceiver?
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        delegate?.addMovieToFavorite(fromCell: self)
    }
    
    func configure(with model: Movie) {
        guard let imageURLString = model.imageURLString else { return }
        movieNameLabel.text = model.name
        movieDescriptionLabel.text = model.description
        movieImageView.withImageDownloaded(from: "https://image.tmdb.org/t/p/w500\(imageURLString)")
    }
}
