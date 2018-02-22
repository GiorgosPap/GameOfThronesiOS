//
//  HeroViewModel.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import RxSwift

final class HeroViewModel {

    //MARK: - Dependecies
    private let heroService: HeroService
    private let disposeBag = DisposeBag()

    //MARK: - Model
    private var hero: Observable<Hero?>? = nil

    //let heroName: Observable<String>
    //let heroCulture: Observable<String>
    //let heroTitles: Observable<[String]>

    ///Sending new elements trough this property starts a search request.
    //var searchText = Variable<String>("")
    

    //MARK: - Set up

    init(heroService: HeroService) {

        //Initialise dependencies
        self.heroService = heroService

//        //Subscribe weather to the searchText Observable,
//        //get the latest value and map it to an Observable<Weather>
//        hero = searchText.asObservable()
//            //wait 0.3 s after the last value to fire a new value
//            .debounce(0.3, scheduler: MainScheduler.instance)
//            //only fire if the value is different than the last one
//            .distinctUntilChanged()
//            //convert Observable<String> to Observable<Weather>
//            .flatMapLatest { searchString -> Observable<Hero> in
//
//                guard !searchString.isEmpty else {
//                    //flatMapLatest will flatten empty Observables
//                    //much like regular flatMap will flatten nil values
//                    return Observable.empty()
//                }
//
//                return heroService.search(withName: "searchString")
//            }
//            //make sure all subscribers use the same exact subscription
//            .share(replay: 1)
        


        //Initialise observers
//        heroName = hero
//            .map { $0.name! }
//
//        heroCulture = hero
//            .map { $0.culture! }
//
//        heroTitles = hero
//            .map { $0.titles! }
    }
    
    func fetch() -> Observable<Hero> {
        return heroService.fetchHero()
    }
    
    func fetchImage(imageUrl: String)->Observable<UIImage> {
        return heroService.fetchHeroImage(imageUrl: imageUrl)
    }



}

