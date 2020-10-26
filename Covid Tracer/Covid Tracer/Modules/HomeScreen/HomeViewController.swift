//
//  HomeViewController.swift
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

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets -
    @IBOutlet weak var covidCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var currentCountryButton: UIBarButtonItem!
    
    // MARK: - Public properties -

    var presenter: HomePresenterInterface!

    // MARK: - Private properties -

    var headerData: HeaderData = .init(activeCases: "n/a", deathCases: "n/a", newCases: "n/a"){
        didSet {
            covidCollectionView.reloadData()
        }
    }
    
    var cellItems: [StatisticTableCellItem] = [] {
        didSet {
            covidCollectionView.reloadData()
        }
    }
    
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        covidCollectionView.setCollectionViewLayout(UIHelper.createTwoColumnFlowLayout(for: view), animated: true, completion: nil)
        covidCollectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CovidHeaderNew")
        covidCollectionView.dataSource = self
        
        
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}

private extension HomeViewController {

    func setupView() {
        let output = Home.ViewOutput(searchHandler: searchButton.rx.tap.asSignal())
        
        
        let input = presenter.configure(with: output)
        input.headerData
            .drive(self.rx.headerData)
            .disposed(by: disposeBag)
        
        input.cellItems
            .drive(self.rx.cellItems)
            .disposed(by: disposeBag)
        
        input
            .currentCountry
            .compactMap { $0 }
            .map { $0.capitalized }
            .drive(currentCountryButton.rx.title)
            .disposed(by: disposeBag)
    }

}

// MARK: - TableView Delegate -
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        cellItems[indexPath.row].cell(from: covidCollectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseID, for: indexPath) as! HeaderCollectionReusableView
        
        headerView.configure(with: headerData)
        return headerView
    }
}

