//
//  Hero.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import ObjectMapper

class Hero: Mappable {
    //MARK: Properties
    var name: String?
    var culture: String?
    var pageRank: Int?
    var titles: [String]?
    var imageLink: String?
    
    var image: UIImage?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name      <- map["name"]
        culture   <- map["culture"]
        pageRank  <- map["pageRank"]
        titles    <- map["titles"]
        imageLink <- map["imageLink"]
    }
}
