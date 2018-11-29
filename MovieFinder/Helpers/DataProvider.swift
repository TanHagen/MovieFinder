//
//  DataProvider.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class DataProvider: NSObject, UITableViewDataSource {
    
    weak var moviesListViewController: MoviesListViewController?
    
    let dataManager = DataManager()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dataManager.cellIdentifider, for: indexPath) as? MovieCell else {
            return MovieCell()
        }
        cell.delegate = moviesListViewController
        cell.configure(with: dataManager.movies[indexPath.row])
        return cell
    }
}
