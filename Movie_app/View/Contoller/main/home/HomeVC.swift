//
//  PopularVC.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var menuCllectionView: UICollectionView! {
        didSet {
            menuCllectionView.delegate = self
            menuCllectionView.dataSource = self
            menuCllectionView.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "ContainerCell", bundle: nil), forCellWithReuseIdentifier: "ContainerCell")
        }
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05490196078, green: 0.05490196078, blue: 0.05490196078, alpha: 1)
        
        let selectedIndexpath = IndexPath(row: 0, section: 0)
        menuCllectionView.selectItem(at: selectedIndexpath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    let menuTitle = ["Popular", "Top-rated", "Upcoming"]
    
    
}

//MARK: - CollectionView Configuration
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == menuCllectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell() }
            cell.name.text = menuTitle[indexPath.row]
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContainerCell", for: indexPath) as? ContainerCell else { return UICollectionViewCell() }
            cell.delegate = self
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == menuCllectionView {
            let size = CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
            return size
        } else {
            let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuCllectionView {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

//MARK: - Present DetailVC Delegate Method
extension HomeVC: PresentDetailDelegate {
    func presentDetailVC() {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
