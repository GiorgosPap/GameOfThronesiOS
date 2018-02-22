//
//  HouseService.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 16/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import Foundation
import Alamofire
import RxSwift

class HouseService {
    
    private struct Constants {
        static let URL = "https://api.got.show/api/houses/"
    }
    
    func fetchHouse(nameQuery: String) ->Observable<House> {
        print(nameQuery)
        return Observable<House>.create { (observer) -> Disposable in
            let requestReference =
                Alamofire.request(Constants.URL+"House%20"+nameQuery ?? "Stark")
                    .validate(statusCode: 200..<300)
                    .responseObject { (response: DataResponse<HouseResponse>) in
                        switch response.result {
                        case .success:
                            if let resp = response.result.value {
                                print(resp.data?.name as Any)
                                observer.onNext(resp.data!)
                                observer.onCompleted()
                            }else if let error = response.result.error {
                                observer.onError(error)
                                print(error)
                            }
                        case .failure(let error):
                            observer.onError(error)
                            print(error)
                        }
            }
            return Disposables.create(with: { requestReference.cancel() })
        }
    }
    
}


