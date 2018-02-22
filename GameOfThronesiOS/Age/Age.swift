//
//  Age.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class Age: Mappable {
    //MARK: Properties
    var endDate: Int?
    var startDate: Int?
    var successor: String?
    var predecessor: String?
    var name: String?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        endDate   <- map["endDate"]
        startDate <- map["startDate"]
        successor <- map["successor"]
        predecessor <- map["predecessor"]
        name <- map["name"]
    }
}
