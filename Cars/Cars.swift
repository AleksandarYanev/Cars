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
    
 
    }
    
    func downloadCarsDetails(completed: @escaping DownloadComplete) {
        
        let user = "caustomediffelflestacout"
        let password = "2a6726d41232bad414125d9aa2057d45f87d1042"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(CARS_URL,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                if response.result.value != nil{
                    print(response)
                }else{
                    
                }
        
//            let result = response.result
//            print(response)
            
        }
       completed() 
    }

