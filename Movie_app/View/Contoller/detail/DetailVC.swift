//
//  DetailVC.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var descrip: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(model: MovieModel) {
        
    }
}
