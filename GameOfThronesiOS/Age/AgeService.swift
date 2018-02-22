//
//  AgeService.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import Alamofire
import RxSwift

class AgeService {
    
    private struct Constants {
        static let URL = "https://api.got.show/api/ages/"
    }
    
    func fetch() ->Observable<[Age]> {
        return Observable<[Age]>.create { (observer) -> Disposable in
            let requestReference =
                Alamofire.request(Constants.URL)
                    .validate(statusCode: 200..<300)
                    .responseArray { (response: DataResponse<[Age]>) in
                        print(response)
                        switch response.result {
                        case .success:
                            if let ageResponse = response.result.value {
                                print(ageResponse as Any)
                                observer.onNext(ageResponse)
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

