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
            let percentage = ((Float(todayCase.active) / Float(yesterdayCase.active) - 1) * 100)
            
            trendImageView.image = percentage < 0 ? TrendImage.downTrend : TrendImage.upTrend
            trendImageView.tintColor = percentage < 0 ? .systemGreen : .systemPink
            
            todayCasesLabel.text = "\(todayCase.active)"
            yesterdayCasesLabel.text = "\(yesterdayCase.active)"
            percentageChangeLabel.text = "\(Int(percentage))%"
            
        case .new:
            titleCellLabel.text = "New"
            let percentage = ((Float(todayCase.confirmed) / Float(yesterdayCase.confirmed) - 1) * 100)
            
            trendImageView.image = percentage < 0 ? TrendImage.downTrend : TrendImage.upTrend
            trendImageView.tintColor = percentage < 0 ? .systemGreen : .systemPink
            
            todayCasesLabel.text = "\(todayCase.confirmed)"
            yesterdayCasesLabel.text = "\(yesterdayCase.confirmed)"
            percentageChangeLabel.text = "\(Int(percentage))%"
        case .death:
            titleCellLabel.text = "Death"
            let percentage = ((Float(todayCase.deaths) / Float(yesterdayCase.deaths) - 1) * 100)
            
            trendImageView.image = percentage < 0 ? TrendImage.downTrend : TrendImage.upTrend
            trendImageView.tintColor = percentage < 0 ? .systemGreen : .systemPink
            
            todayCasesLabel.text = "\(todayCase.deaths)"
            yesterdayCasesLabel.text = "\(yesterdayCase.deaths)"
            percentageChangeLabel.text = "\(Int(percentage))%"
        case .recovered:
            titleCellLabel.text = "Recovered"
            
            var percentage: Float = 0.0
            if todayCase.recovered == 0 && yesterdayCase.recovered == 0 {
                percentage = 0.0
            } else {
                percentage = ((Float(todayCase.recovered) / Float(yesterdayCase.recovered) - 1) * 100)
            }
            trendImageView.image = percentage < 0 ? TrendImage.downTrend : TrendImage.upTrend
            
            trendImageView.tintColor = percentage > 0 ? .systemGreen : .systemPink
            
            todayCasesLabel.text = "\(todayCase.recovered)"
            yesterdayCasesLabel.text = "\(yesterdayCase.recovered)"
            percentageChangeLabel.text = "\(Int(percentage))%"
        }
        
    }
    
}
