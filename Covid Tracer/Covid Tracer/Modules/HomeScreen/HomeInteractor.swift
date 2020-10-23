//
//  HomeInteractor.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift

final class HomeInteractor {
    let covidService = CovidService()
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorInterface {
    func getCovidData(for country: String) -> Single<[CovidData]> {
        return covidService.getCovidData(for: country)
    }
    
}