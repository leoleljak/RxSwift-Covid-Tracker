//
//  StatisticCollectionViewCellItem.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

enum StatisticCellType: CaseIterable {
    case active
    case new
    case death
    case recovered
}

class StatisticTableCellItem {

    let model: [CovidData]
    let cellType: StatisticCellType

    init(model: [CovidData], cellType: StatisticCellType) {
        self.model = model
        self.cellType = cellType
    }

}

extension StatisticTableCellItem {

    func cell(from tableView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: StatisticCollectionViewCell.reuseId, for: indexPath) as! StatisticCollectionViewCell
        cell.configure(with: self, for: indexPath.row)
        return cell
    }

}
