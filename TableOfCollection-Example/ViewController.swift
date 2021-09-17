//
//  TableOfCollection.swift
//  TableOfCollection-Example
//
//  Created by Belal Samy on 16/09/2021.
//

import UIKit

final class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ImageView: UIImageView!
    
    // constants
    let continueWatching = ["Movie 1", "Movie 2", "Movie 3", "Movie 4"]
    let popular = ["Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5", "Movie 6", "Movie 7"]
    let movies = ["Movie 1", "Movie 2", "Movie 3", "Movie 5", "Movie 6", "Movie 7"]
    let series = ["series 1"]
    let plays = ["Play 1", "Play 2", "Play 3"]
    let games = ["Game 1", "Game 2"]

    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    //MARK: - functions
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableView Data Source

extension ViewController: UITableViewDataSource {

    // section
     func numberOfSections(in _: UITableView) -> Int {
        return TableSections.allCases.count
    }
    
    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
       let section = TableSections.allCases[section]
        return section.ui.sectionTitle
   }

    // row
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSections.allCases[indexPath.section]
        var cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: .default, reuseIdentifier: TableCell.identifier)
            switch section {
            case .continueWatching, .Movies, .Series, .Plays, .games:
                cell?.collectionFlowLayout.scrollDirection = .horizontal
                
            case .popular:
                cell?.collectionFlowLayout.scrollDirection = .vertical
            }
            
            cell?.selectionStyle = .none
        }
        return cell!
    }
}


// MARK: - UITableView Delegate

extension ViewController: UITableViewDelegate {
    
    // section
    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let myLabel = UILabel()
       myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 30)
       myLabel.font = UIFont.boldSystemFont(ofSize: 25)
       myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

       let headerView = UIView()
       headerView.addSubview(myLabel)

       return headerView
    }
    
    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
       return 0
    }
    
     // row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = TableSections.allCases[indexPath.section]
        return section.ui.sectionHeight
    }
    
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       guard let cell: TableCell = cell as? TableCell else { return }
       cell.setCollectionView(dataSource: self, delegate: self, indexPath: indexPath)
    }
}


// MARK: - UICollectionView Data Source

extension ViewController: UICollectionViewDataSource {

    // section
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }
    
    // item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = TableSections.allCases[collectionView.tag]
        switch section {
        case .continueWatching:
            return movies.count
            
        case .popular:
            return popular.count

        case .Movies:
            return movies.count

        case .Series:
            return series.count

        case .Plays:
            return plays.count

        case .games:
            return games.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = TableSections.allCases[collectionView.tag]
        
        switch section {
        case .popular, .Movies, .Series, .Plays, .games:
            let cell1 = collectionView.dequeue(indexPath: indexPath) as CollectionCell
            cell1.backgroundColor = section.ui.itemColor
            return cell1
            
        case .continueWatching:
            let cell2 = collectionView.dequeue(indexPath: indexPath) as CollectionCell2
            cell2.backgroundColor = section.ui.itemColor
            return cell2
        }
     
   
    }
}


// MARK: - UICollectionView Delegate

extension ViewController: UICollectionViewDelegate {
    // item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = TableSections.allCases[collectionView.tag]
        print("section : \(section.ui.sectionTitle) => \(indexPath.item)")
    }
}


// MARK: - UICollectionViewDelegate Flow Layout

extension ViewController: UICollectionViewDelegateFlowLayout {
    // section
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 10 // vertical spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return 0 // horizontal spacing
    }
    
    // item
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let section = TableSections.allCases[collectionView.tag]
        switch section {
        case .continueWatching:
            return collectionView.size(rows: 1, columns: 1.5)
            
        case .popular:
            return collectionView.size(rows: 2, columns: 3)

        case .Movies, .Series, .Plays, .games:
            return collectionView.size(rows: 1, columns: 3)
        }
        
    }
}


