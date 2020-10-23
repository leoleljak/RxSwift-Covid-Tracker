//
//  HomeNavigationController.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        navigationBar.prefersLargeTitles = true
    }
}
