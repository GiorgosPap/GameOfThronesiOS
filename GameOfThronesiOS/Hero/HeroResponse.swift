//
//  HeroResponse.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import ObjectMapper

class HeroResponse: Mappable {
    //MARK: Properties
    var message: String?
    var data: Hero?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        message <- map["message"]
        data    <- map["data"]
    }
}

