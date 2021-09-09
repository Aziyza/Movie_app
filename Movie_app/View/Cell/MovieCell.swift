//
//  MovieCell.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: MovieModel) {
        image.image = model.image
    }
}
