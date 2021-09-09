//
//  MovieCell.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: MovieModel) {
        self.image.load(urlString: model.poster_path)
    }
    
    func configureDetail(model: Cast) {
        self.image.load(urlString: model.profile_path)
    }
}

//MARK: - Load image by urlString

extension UIImageView {
    func load(urlString: String?) {
        let url = URLs()
        let imageUrl = URL(string: url.imageURL + (urlString ?? ""))
        if imageUrl != nil {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: imageUrl)
        }
    }
}
