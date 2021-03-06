//
//  SearchInterfaces.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol SearchWireframeInterface: WireframeInterface {
}

protocol SearchViewInterface: ViewInterface {
}

protocol SearchPresenterInterface: PresenterInterface {
    func configure(with output: Search.ViewOutput) -> Search.ViewInput
}

protocol SearchInteractorInterface: InteractorInterface {
}

enum Search {

    struct ViewOutput {
        let searchText: Driver<String?>
    }

    struct ViewInput {
    }

}
