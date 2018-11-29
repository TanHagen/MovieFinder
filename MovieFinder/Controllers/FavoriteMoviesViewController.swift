//
//  FavoriteMoviesViewController.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class FavoriteMoviesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "favoriteCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    var favoriteMovies: [Movie] {
        guard let movies = try? UserDefaults.standard.get(objectType: [Movie].self, forKey: "favoriteMovies"), let dataSource = movies else { return [] }
        return dataSource
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieCell else { return MovieCell() }
        cell.configure(with: favoriteMovies[indexPath.row])
        return cell
    }
}
