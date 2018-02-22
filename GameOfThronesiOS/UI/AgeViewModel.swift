//
//  AgeViewModel.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import RxSwift

final class AgeViewModel {
    
    //MARK: - Dependecies
    private let ageService: AgeService
    
    //MARK: - Model
    //private var age: Observable<[Age]>
    
    //MARK: - Set up
    init(ageService: AgeService) {
        //Initialise dependencies
        self.ageService = ageService
    }
    
    func fetch() -> Observable<[Age]> {
        return ageService.fetch()
    }
    
    
    
}


