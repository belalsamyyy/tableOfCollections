//
//  UICollectionView+Extensions.swift
//  moled
//
//  Created by Khalid Flutter on 05/09/2021.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell  {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else  {
            fatalError("Error in dequeue extension code !")
        }
        return cell
    }
    
}
