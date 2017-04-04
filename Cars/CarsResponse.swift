////
////  CarsResponse.swift
////  Cars
////
////  Created by Aleksandar Yanev on 1/16/17.
////  Copyright © 2017 AleksandarYanev. All rights reserved.
//
//
//import Foundation
//import ObjectMapper
//
//class CarResponse: Mappable {
//    
//    required init?(map: Map) {
//    }
//    
//    var totalRows = 0
//    var offset = 0
//    var rows: [RowsResponse]?
//    
//    func mapping(map: Map) {
//        totalRows <- map["total_rows"]
//        offset <- map["offset"]
//        rows <- map["rows"]
//    }
//}
//
//class RowsResponse: Mappable {
//    
//    required init?(map: Map) {
//    }
//    
//    var id = ""
//    var key = ""
//    var value: ValueResponse?
//    
//    func mapping(map: Map) {
//        id <- map["id"]
//        key <- map["key"]
//        value <- map["value"]
//    }
//}
//
//class ValueResponse: Mappable {
//    
//    required init?(map: Map) {
//    }
//    
//    var id = ""
//    var rev = ""
//    var type = ""
//    var manufacturer = ""
//    var model = ""
//    var secondHand = false
//    var summary = ""
//    var year = ""
//    var horsepower: Int32 = 0
//    
//    func mapping(map: Map) {
//        id <- map["_id"]
//        rev <- map["_rev"]
//        type <- map["type"]
//        manufacturer <- map["manufacturer"]
//        model <- map["model"]
//        secondHand <- map["secondHand"]
//        summary <- map["summary"]
//        year <- map["year"]
//        horsepower <- map["horsepower"]
//        
//    }
//}
//
//class CreateRespone: Mappable {
//    
//    required init?(map: Map) {
//        
//    }
//    
//    var ok = false
//    
//    func mapping(map: Map) {
//        
//        ok <- map["ok"]
//    }
//}
//
//class DeleteResponse: Mappable {
//    
//    required init?(map: Map) {
//        
//    }
//    
//    var ok = false
//    
//    func mapping(map: Map) {
//        
//        ok <- map["ok"]
//        
//    }
//}
