//
//  PopularVC.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

class HomeVC: UIViewController {
    
    let urls = URLs()
    var data:[MovieModel] = []
    let menuTitle = ["Popular", "Top-rated", "Upcoming"]
    let searchController = UISearchController()
    
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
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search book"
        
        let selectedIndexpath = IndexPath(row: 0, section: 0)
        menuCllectionView.selectItem(at: selectedIndexpath, animated: false, scrollPosition: .centeredHorizontally)
        
    }
    
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
//            cell.homeViewModel.getMoviesData(path: urls.popular)
            switch indexPath.row {
            case 0:
                cell.homeViewModel.getMoviesData(path: urls.popular)
            case 1:
                cell.homeViewModel.getMoviesData(path: urls.toprated)
            case 2:
                cell.homeViewModel.getMoviesData(path: urls.upcoming)
            default:
                cell.homeViewModel.getMoviesData(path: urls.popular)
            }
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

//MARK: - SearchController Delegate Methods
extension HomeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}

//MARK: - Present DetailVC Delegate Method
extension HomeVC: ContainerCellDelegate {
    func presentDetailVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

