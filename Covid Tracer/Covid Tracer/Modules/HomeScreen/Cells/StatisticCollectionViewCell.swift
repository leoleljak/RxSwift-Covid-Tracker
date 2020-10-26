//
//  StatisticCollectionViewCell.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

class StatisticCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var todayCasesLabel: UILabel!
    @IBOutlet weak var yesterdayCasesLabel: UILabel!
    @IBOutlet weak var trendImageView: UIImageView!
    @IBOutlet weak var percentageChangeLabel: UILabel!
    
    
    static let reuseId = "StatisticCell"
    static let cellName = "StatisticCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configAppearance()
    }
    
    func configAppearance() {
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = UIColor.systemBackground
        dropShadowGray()
    }
    
    func configure(with model: StatisticTableCellItem, for row: Int) {
        let cases = model.model
        guard let todayCase = cases.last else { return }
        let yesterdayCase = cases[cases.count - 2]
        
        switch model.cellType {
        
        case .active:
            titleCellLabel.text = "Active"
            setCellData(todayCase: todayCase.active, yesterdayCase: yesterdayCase.active)
            
        case .new:
            titleCellLabel.text = "New"
            setCellData(todayCase: todayCase.confirmed, yesterdayCase: yesterdayCase.confirmed)
            
        case .death:
            titleCellLabel.text = "Death"
            setCellData(todayCase: todayCase.deaths, yesterdayCase: yesterdayCase.deaths)
            
        case .recovered:
            titleCellLabel.text = "Recovered"
            setCellData(todayCase: todayCase.recovered, yesterdayCase: yesterdayCase.recovered, reverseTrendImage: true)
        }
        
    }
    
}

private extension StatisticCollectionViewCell {
    func setCellData(todayCase: Int, yesterdayCase: Int, reverseTrendImage: Bool = false) {
        var percentage: Float = 0.0
        if todayCase == 0 && yesterdayCase == 0 {
            percentage = 0.0
        } else {
            percentage = ((Float(todayCase) / Float(yesterdayCase) - 1) * 100)
        }
        
        trendImageView.image = percentage < 0 ? TrendImage.downTrend : TrendImage.upTrend
        
        if reverseTrendImage {
            trendImageView.tintColor = percentage < 0 ? .systemPink : .systemGreen
        } else {
            trendImageView.tintColor = percentage < 0 ? .systemGreen : .systemPink
        }
        
        todayCasesLabel.text = "\(todayCase)"
        yesterdayCasesLabel.text = "\(yesterdayCase)"
        percentageChangeLabel.text = "\(Int(percentage))%"
    }
}
