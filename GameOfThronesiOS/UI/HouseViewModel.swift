//
//  HouseViewModel.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 16/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import RxSwift

final class HouseViewModel {
    
    //MARK: - Dependecies
    private let houseService: HouseService
    private let disposeBag = DisposeBag()
    
    //MARK: - Model
    private var house: Observable<House>
    
    var houseName: Observable<String>
    var houseTitle: Observable<String>
    var houseCoatOfArms: Observable<String>
    var houseLord: Observable<String>
    var houseRegion: Observable<String>
    
    var nameQuery: String = ""
    
    //MARK: - Set up
    init(houseService: HouseService) {
        
        //Initialise dependencies
        self.houseService = houseService
        
        house = houseService.fetchHouse(nameQuery: self.nameQuery)
        
        //Initialise observers
        houseName = house
            .map { $0.name! }
        houseTitle = house
            .map { $0.title! }
        houseCoatOfArms = house
            .map { $0.coatOfArms! }
        houseLord = house
            .map { $0.currentLord! }
        houseRegion = house
            .map { $0.region! }
    }
    
    func fetch() {
        house = houseService.fetchHouse(nameQuery: self.nameQuery)
        
        //Initialise observers
        houseName = house
            .map { $0.name! }
        houseTitle = house
            .map { $0.title! }
        houseCoatOfArms = house
            .map { $0.coatOfArms! }
        houseLord = house
            .map { $0.currentLord! }
        houseRegion = house
            .map { $0.region! }
    }
    
    func getNameQuery()->String{
        return self.nameQuery;
    }
    
    func setNameQuery(nameQuery: String) {
        self.nameQuery = nameQuery
    }
    
}


