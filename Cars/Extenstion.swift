//
//  Extenstion.swift
//  Cars
//
//  Created by Aleksandar Yanev on 1/17/17.
//  Copyright © 2017 AleksandarYanev. All rights reserved.
//

import Foundation

extension Car {
    
    func toJSON() -> Dictionary<String, AnyObject> {
        
        var dictionary = Dictionary<String, AnyObject>()
        
        dictionary["id"] = self.id as AnyObject?
        dictionary["rev"] = self.rev as AnyObject?
        dictionary["type"] = "car" as AnyObject?
        dictionary["manufacturer"] = self.manufacturer as AnyObject?
        dictionary["model"] = self.model as AnyObject?
        dictionary["secondHand"] = self.secondHand as AnyObject?
        dictionary["summary"] = self.summary as AnyObject?
        dictionary["year"] = self.year as AnyObject?
        dictionary["horsepower"] = self.horsepower as AnyObject?
     
        return dictionary
    }
    
}
