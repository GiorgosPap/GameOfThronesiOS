//
//  Event.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 01/03/2018.
//  Copyright © 2018 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class Event: Mappable {
    //MARK: Properties
    var name: String?
    var date: Int?
    var age: Age?
    var createdAt: Date?
    var updatedAt: Date?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        name   <- map["name"]
        date <- map["date"]
        age <- map["age"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
    }
}
