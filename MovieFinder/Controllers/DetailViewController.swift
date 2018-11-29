//
//  DetailViewController.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    
    var movieName: String!
    var movieDescription: String!
    var movieImageURLString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        movieNameLabel.text = movieName
        movieDescriptionLabel.text = movieDescription
        movieImageView.withImageDownloaded(from: movieImageURLString)
    }
}
