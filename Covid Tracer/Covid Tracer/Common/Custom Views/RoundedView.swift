//
//  RoundedView.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

@IBDesignable class RoundedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    @IBInspectable
    var roundedCornerRadius: CGFloat = 15 {
        didSet {
            layer.cornerRadius = roundedCornerRadius
        }
    }
    
    @IBInspectable
    var colorBackground: UIColor = .systemGray6 {
        didSet {
            backgroundColor = colorBackground
        }
    }
    
}
