//
//  UIImageViewExtension.swift
//  MovieFinder
//
//  Created by Антон Зайцев on 29.11.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private func imageDownloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response as? HTTPURLResponse,
                let mimeType = response.mimeType,
                response.statusCode == 200,
                mimeType.hasPrefix("image"),
                error == nil else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    func withImageDownloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        imageDownloaded(from: url)
    }
}
