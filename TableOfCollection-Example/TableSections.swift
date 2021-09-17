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
    
    var ui: (sectionTitle: String, sectionHeight: CGFloat, itemColor: UIColor) {
        switch self {
        case .continueWatching:
            return ("Continue Watching", 200, .green)
            
        case .popular:
            return ("Popular", 250, .red)

        case .Movies:
            return ("Movies", 200, .blue)

        case .Series:
            return ("Series", 200, .orange)

        case .Plays:
            return ("Plays", 200, .brown)

        case .games:
            return ("Games", 200, .purple)

        }
    }

}

