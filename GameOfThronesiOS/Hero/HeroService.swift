//
//  APIService.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireImage
import RxSwift

class HeroService {
    
    private struct Constants {
        static let URL = "https://api.got.show/api/characters/daenerys"
    }
    
    func fetchHero() ->Observable<Hero> {
        return Observable<Hero>.create { (observer) -> Disposable in
            let requestReference =
                Alamofire.request(Constants.URL)
                    .validate(statusCode: 200..<300)
                    .responseObject { (response: DataResponse<HeroResponse>) in
                        switch response.result {
                        case .success:
                            if let heroResponse = response.result.value {
                                observer.onNext(heroResponse.data!)
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
    
    func fetchHeroImage(imageUrl: String) -> Observable<UIImage> {
        return Observable<UIImage>.create { (observer) -> Disposable in
            let requestReference =
                Alamofire.request(imageUrl)
                    .validate(statusCode: 200..<300)
                    .responseImage { (response: DataResponse<UIImage>) in
                        switch response.result {
                        case .success:
                            if let image = response.result.value {
                                print("image downloaded: \(image)")
                                observer.onNext(image)
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
