//
//  House.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 16/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import ObjectMapper

class House: Mappable {
    //MARK: Properties
    var ancestralWeapon : [String]?
    var cadetBranch : String?
    var coatOfArms : String?
    var currentLord : String?
    var imageLink : String?
    var name : String?
    var overlord : String?
    var region : String?
    var title : String?
    var words : String?
    
    var photo: UIImage?
    
    required init?(map: Map) {
        
    }
    
    init?(name: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty  else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
    }
    
    // Mappable
    func mapping(map: Map){
        ancestralWeapon <- map["ancestralWeapon"]
        cadetBranch <- map["cadetBranch"]
        coatOfArms <- map["coatOfArms"]
        currentLord <- map["currentLord"]
        imageLink <- map["imageLink"]
        name <- map["name"]
        overlord <- map["overlord"]
        region <- map["region"]
        title <- map["title"]
        words <- map["words"]
    }
}
