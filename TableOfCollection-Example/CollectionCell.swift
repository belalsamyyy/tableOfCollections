//
//  CollectionCell.swift
//  TableOfCollection-Example
//
//  Created by Belal Samy on 16/09/2021.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}
