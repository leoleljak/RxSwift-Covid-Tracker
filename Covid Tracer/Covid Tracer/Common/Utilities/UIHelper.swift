//
//  UIHelper.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

enum UIHelper {
    static func createTwoColumnFlowLayout(for view:UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 20
        let minimumItemSpacing: CGFloat = 20
        let availableWidth = width -  (padding * 2) - (minimumItemSpacing)
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 0, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 200)
        flowLayout.headerReferenceSize = CGSize(width: width, height: 150)
        
        return flowLayout
    }
}
