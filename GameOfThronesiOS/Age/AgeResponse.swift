//
//  AgeResponse.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class AgeResponse: Mappable {
    //MARK: Properties
    var message: String?
    var data: Age?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        message <- map["message"]
        data    <- map["data"]
    }
}
