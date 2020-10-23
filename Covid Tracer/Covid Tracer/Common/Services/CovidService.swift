//
//  CovidService.swift
//  Covid Tracer
//
//  Created by Leo Leljak on 23/10/2020.
//

import Foundation
import Alamofire
import RxSwift

class CovidService {
    
    func getCovidData(for country: String) -> Single<[CovidData]> {
        
        Single.create { single in
            let apiCall = AF.request(Constants.API_BASE.appending("\(country)"),
                       method: .get,
                       encoding: JSONEncoding.default)
                .validate()
                .responseDecodable(of: [CovidData].self) { response in
                    switch response.result {
                    case .success(let data):
                        single(.success(data))
                    case .failure(let error):
                        single(.error(error))
                    }
                }
            
            return Disposables.create {
                apiCall.cancel()
            }
            
        }
    }
    
}
