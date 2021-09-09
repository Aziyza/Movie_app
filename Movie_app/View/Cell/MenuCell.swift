//
//  MenuCell.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? #colorLiteral(red: 0.8156862745, green: 0.03137254902, blue: 0.03137254902, alpha: 1) : .clear
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.name.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Initialization code
    }

}
