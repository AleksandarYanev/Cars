//
//  Cars.swift
//  Cars
//
//  Created by Aleksandar Yanev on 1/12/17.
//  Copyright © 2017 AleksandarYanev. All rights reserved.
//

import Foundation
import Alamofire

class Cars {
    
    var _manufacturer: String!
    var _model: String!
    var _secondHand: Bool!
    var _summary: String!
    var _year: String!
    var _horsepower: Int!
    
    var manufacturer: String {
        if _manufacturer == nil {
            _manufacturer = ""
        }
        return _manufacturer
    }
    
    var model: String {
        if _model == nil {
            _model = ""
        }
        return _model
    }
    
    var secondHand: Bool {
        return _secondHand
    }
    
    var summary: String {
        if _summary == nil {
            _summary = ""
        }
        return _summary
    }
    
    var year: String {
        if _year == nil {
            _year = ""
        }
        return _year
    }
    
    var horsepower: Int {
        if _horsepower == nil {
            _horsepower = 0
        }
        return _horsepower
    }
    
    func downloadCarsDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(CARS_URL).responseJSON { response in
            let result = response.result
            
            print(response)
            
        }
       completed() 
    }
}
