//
//  TableSections.swift
//  TableOfCollection-Example
//
//  Created by Belal Samy on 16/09/2021.
//

import Foundation
import UIKit

enum TableSections: CaseIterable {
    case continueWatching
    case popular
    case Movies
    case Series
    case Plays
    case games
    
    var ui: (headerTitle: String, color: UIColor, size: CGSize) {
        switch self {
        case .continueWatching:
            return ("Continue Watching", .green, CGSize(width: 250, height: 150))
            
        case .popular:
            return ("Popular", .red, CGSize(width: 150, height: 200))

        case .Movies:
            return ("Movies", .blue, CGSize(width: 150, height: 200))

        case .Series:
            return ("Series", .orange, CGSize(width: 150, height: 200))

        case .Plays:
            return ("Plays", .brown, CGSize(width: 150, height: 200))

        case .games:
            return ("Games", .purple, CGSize(width: 150, height: 200))

        }
    }

}
