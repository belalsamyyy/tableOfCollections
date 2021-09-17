//
//  UITableView+Extensions.swift
//  moled
//
//  Created by Khalid Flutter on 05/09/2021.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell  {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else  {
            fatalError("Error in dequeue extension code !")
        }
        return cell
    }
  
}
