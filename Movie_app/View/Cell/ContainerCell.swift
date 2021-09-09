//
//  ContainerCell.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit

protocol PresentDetailDelegate {
    func presentDetailVC()
}

class ContainerCell: UICollectionViewCell {
    
    var delegate: PresentDetailDelegate?

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let data:[MovieModel] = [
        MovieModel(image: #imageLiteral(resourceName: "movie"),
                   title: "",
                   poster_path: "",
                   overview: "",
                   genre: [Genre(id: 1, name: "Drama")],
                   budget: 0,
                   language: "en",
                   release_date: "",
                   credits: Credits(cast: [Cast(gender: 1, id: 1, name: "",                     profile_path: "", cast_id: 1)],
                                    crew: [Crew(gender: 1, id: 1, name: "", department: "", job: "")])),
        MovieModel(image: #imageLiteral(resourceName: "movie-1"),
                   title: "",
                   poster_path: "",
                   overview: "",
                   genre: [Genre(id: 1, name: "Drama")],
                   budget: 0,
                   language: "en",
                   release_date: "",
                   credits: Credits(cast: [Cast(gender: 1, id: 1, name: "",                     profile_path: "", cast_id: 1)],
                                    crew: [Crew(gender: 1, id: 1, name: "", department: "", job: "")])),
        MovieModel(image: #imageLiteral(resourceName: "movie"),
                   title: "",
                   poster_path: "",
                   overview: "",
                   genre: [Genre(id: 1, name: "Drama")],
                   budget: 0,
                   language: "en",
                   release_date: "",
                   credits: Credits(cast: [Cast(gender: 1, id: 1, name: "",                     profile_path: "", cast_id: 1)],
                                    crew: [Crew(gender: 1, id: 1, name: "", department: "", job: "")])),
        MovieModel(image: #imageLiteral(resourceName: "movie-1"),
                   title: "",
                   poster_path: "",
                   overview: "",
                   genre: [Genre(id: 1, name: "Drama")],
                   budget: 0,
                   language: "en",
                   release_date: "",
                   credits: Credits(cast: [Cast(gender: 1, id: 1, name: "",                     profile_path: "", cast_id: 1)],
                                    crew: [Crew(gender: 1, id: 1, name: "", department: "", job: "")]))
    ]
    
}

extension ContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        cell.configure(model: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3-10, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentDetailVC()
    }
}
