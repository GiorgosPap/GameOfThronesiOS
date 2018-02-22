//
//  HouseResponse.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 16/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class HouseResponse: Mappable {
    //MARK: Properties
    var message: String?
    var data: House?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        message <- map["message"]
        data    <- map["data"]
    }
}

