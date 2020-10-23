//
//  HeaderCollectionReusableView.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - IBOutlets -
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var activeCasesLabel: UILabel!
    @IBOutlet weak var deathCasesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dropShadowGray()
    }
    
    func configure(with headerData: HeaderData) {
        newCasesLabel.text = headerData.newCases
        activeCasesLabel.text = headerData.activeCases
        deathCasesLabel.text = headerData.deathCases
    }
    
    
    
}
