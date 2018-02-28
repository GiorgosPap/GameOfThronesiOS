//
//  Culture.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 28/02/2018.
//  Copyright © 2018 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class Culture: Mappable {
    //MARK: Properties
    var required: Bool?
    var type: String?
    var unique: Bool?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        required   <- map["required"]
        type <- map["type"]
        unique <- map["unique"]
    }
}
