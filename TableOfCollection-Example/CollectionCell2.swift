//
//  CollectionCell2.swift
//  TableOfCollection-Example
//
//  Created by Belal Samy on 17/09/2021.
//

import UIKit

class CollectionCell2: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            myLabel.text = movie?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}

