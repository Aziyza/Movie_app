//
//  ContainerCell.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit


class ContainerCell: UICollectionViewCell {
    
    var delegate: ContainerCellDelegate?
    var homeViewModel = HomeViewModel()
    let urls = URLs()
    var data:[MovieModel] = []

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeViewModel.delegate = self
        
        
        
    }
    
    
    
}

extension ContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return data.count
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
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        vc.configure(model: data[indexPath.row])
        delegate?.presentDetailVC(vc: vc)
    }
}

extension ContainerCell: HomeVMDelegate {
    func getMovies(data: [MovieModel]) {
        self.data = data
        collectionView.reloadData()
    }
    
}
