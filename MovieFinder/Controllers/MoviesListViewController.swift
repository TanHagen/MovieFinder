//
//  MoviesListViewController.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class MoviesListViewController: UIViewController, UISearchBarDelegate, FavoritesTransceiver {
    
    @IBOutlet private var dataProvider: DataProvider! {
        didSet {
            dataProvider.moviesListViewController = self
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailVCSegue", let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        let movie = dataProvider.dataManager.movies[indexPath.row]
        detailViewController.movieName = movie.title
        detailViewController.movieDescription = movie.overview
        guard let imageURLString = movie.posterPath else { return }
        detailViewController.movieImageURLString = "https://image.tmdb.org/t/p/w500\(imageURLString)"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty, let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=616da9d4fb31c592668a30969ce04d04&query=\(text)") else { return }
        
        APIManager.sendRequest(with: text)
        APIManager.getData(from: url) { [weak self] movies in
            self?.dataProvider.dataManager.movies = movies.results
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        searchBar.resignFirstResponder()
    }
    
    func addMovieToFavorite(fromCell cell: UITableViewCell) {
        guard let indexPathForTappedCell = tableView.indexPath(for: cell) else { return }
        let movie = dataProvider.dataManager.movies[indexPathForTappedCell.row]
        if var items = try? UserDefaults.standard.get(objectType: [Movie].self, forKey: "favoriteMovies"),items != nil {
            items?.append(movie)
            dataProvider.dataManager.favoriteMovies = items!
        } else {
            dataProvider.dataManager.favoriteMovies.append(movie)
        }
        try? UserDefaults.standard.set(object: dataProvider.dataManager.favoriteMovies, forKey: "favoriteMovies")
        UserDefaults.standard.synchronize()
    }
}
