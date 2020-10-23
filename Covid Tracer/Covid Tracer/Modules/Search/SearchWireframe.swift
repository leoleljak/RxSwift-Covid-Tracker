//
//  SearchWireframe.swift
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

final class SearchWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Search", bundle: nil)

    // MARK: - Module setup -

    init(searchRelay: BehaviorRelay<String?>) {
        let moduleViewController = storyboard.instantiateViewController(ofType: SearchViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: moduleViewController, interactor: interactor, wireframe: self, relay: searchRelay)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension SearchWireframe: SearchWireframeInterface {
}
