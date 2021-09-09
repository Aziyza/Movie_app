//
//  Protocols.swift
//  Movie_app
//
//  Created by Mac on 9/9/21.
//

import UIKit

protocol HomeVMDelegate {
    func getMovies(data: [MovieModel])
    
}

protocol ContainerCellDelegate {
    func presentDetailVC(vc: UIViewController)
}

protocol DetailVMDelegate {
    func getCast(data: [Cast])
}
