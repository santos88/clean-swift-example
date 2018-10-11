//
//  DogCollectionViewCell.swift
//  DogsApiCleanSwiftExample
//
//  Created by Santos Ramon on 10/10/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class DogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dogImage: UIImageView!
    
    var imageDownloadTask = URLSessionTask()

    func configure(imageName: String) {
        ImageDownloader().getImageFromWeb(downloadTask: &imageDownloadTask, urlString:imageName) {[weak self] (image) in
            DispatchQueue.main.async {
                self?.dogImage.image = image
            }
        }
    }

    override func prepareForReuse() {
        // The magic happens here :)
        // When the cell is going to be reused, the download task is cancelled to avoid troubles.
        imageDownloadTask.cancel()
        dogImage.image = nil
    }

}
