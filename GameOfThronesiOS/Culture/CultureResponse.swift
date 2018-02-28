//
//  CultureResponse.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 28/02/2018.
//  Copyright © 2018 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class CultureResponse: Mappable {
    //MARK: Properties
    var message: String?
    var data: Culture?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        message <- map["message"]
        data    <- map["data"]
    }
}


