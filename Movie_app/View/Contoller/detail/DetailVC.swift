//
//  DetailVC.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

class DetailVC: UIViewController {
    
    var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    var movieName: String?
    var overview: String?
    var movieGenre: String?
    var ImageURL: String?
    var id: Int?
    
    var data:[Cast] = []
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = movieName
        self.image.load(urlString: ImageURL)
        self.descrip.text = overview
        
        
        detailViewModel.delegate = self
        print(id)
        detailViewModel.getCastData(movieId: id!)

    }
    
    func configure(model: MovieModel) {
        
        self.id = model.id
        self.ImageURL = model.backdrop_path
        self.movieName = model.title
        self.overview = model.overview
    }
    
}

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        cell.configureDetail(model: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3-10, height: 150)
    }

}

extension DetailVC: DetailVMDelegate {
    func getCast(data: [Cast]) {
        self.data = data
        collectionView.reloadData()
    }
 
}
