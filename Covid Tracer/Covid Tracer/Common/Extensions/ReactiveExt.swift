//
//  ReactiveExt.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 26/10/2020.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base == HomeViewController {

    var cellItems: Binder<[StatisticTableCellItem]> {
        
        return Binder(base) { (vc, newItems) in
            vc.cellItems = newItems
        }
    }
    
    var headerData: Binder<HeaderData> {
        
        return Binder(base) { (vc, newHeader) in
            vc.headerData = newHeader
        }
    }
}
