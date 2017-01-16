//
//  Cars.swift
//  Cars
//
//  Created by Aleksandar Yanev on 1/12/17.
//  Copyright © 2017 AleksandarYanev. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Cars {
    
    var cars = Array<Car>()
    
    func requestAndMapCars(success: @escaping (CarResponse) -> (), failure: @escaping () -> ()) {
        
        let user = "caustomediffelflestacout"
        let password = "2a6726d41232bad414125d9aa2057d45f87d1042"
        
        Alamofire.request(CARS_URL).authenticate(user: user, password: password).responseObject { (response: DataResponse<CarResponse>) in
            
            if response.result.isSuccess {
                if let value = response.result.value {
                    
                  success(value)
                }
            } else {
                failure()
            }
        }
    }
    
    func addCarsToServer(uploadSuccess) {
        
        
    }
    
    
    
}




//    var cars = Array<Car>()
//
//    func requestAndMapCars(success: @escaping ([Car])  -> (), failure: @escaping () -> ()) {
//
//        let user = "caustomediffelflestacout"
//        let password = "2a6726d41232bad414125d9aa2057d45f87d1042"
//
//        Alamofire.request(CARS_URL).authenticate(user: user, password: password).responseJSON { response in
//
//            if response.result.isSuccess {
//
//                if let value = response.result.value {
//
//                    if let dictionary = value as? Dictionary<String, AnyObject> { // main dictionary
//
//                        if let rowsArray = dictionary["rows"] as? [Dictionary<String, AnyObject>] {  // dictionary for array of rows dictionary
//
//                            for object in rowsArray { // loop every row in the array of dictionaries
//
//                                // id and key can be used here
//
//                                if let valueDictionary = object["value"] as? Dictionary<String, AnyObject> {
//
//                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                                    let context = appDelegate.persistentContainer.viewContext
//                                    let car = Car(context: context)
//
//                                    car.id = valueDictionary["_id"] as? String
//                                    car.rev = valueDictionary["_rev"] as? String
//                                    car.manufacturer = valueDictionary["manufacturer"] as? String
//                                    car.model = valueDictionary["model"] as? String
//                                    car.secondHand = (valueDictionary["secondHand"] as? Bool) ?? false // fix
//                                    car.summary = valueDictionary["summary"] as? String
//                                    car.year = valueDictionary["year"] as? String
//                                    car.horsepower = (valueDictionary["horsepower"] as? Int32) ?? 0 // fix
//                                    car.image = UIImage(named: "new_car_image.jpg")
//
//                                    self.cars.append(car)
//
//                                }
//                            }
//                            success(self.cars)
//                        }
//                    }
//
//                } else {
//                    print("There is no data")
//                    failure()
//                }
//
//            }
//            else {
//                print("there is no data")
//                failure()
//            }
//
//        }















//    func downloadCars(success: @escaping(Array<Car>) -> (), failure: @escaping() -> ()) {
//
//        let user: String = "caustomediffelflestacout"
//        let password: String = "2a6726d41232bad414125d9aa2057d45f87d1042"
//        var cars = Array<Car>()
//
//        Alamofire.request(CARS_URL).authenticate(user: user, password: password).responseJSON { response in
//
//            if response.result.isSuccess {
//
//                print("Success!")
//                if let result = response.result.value {
//                    print(result)
//
//                    if let dictionary = result as? Dictionary<String, AnyObject> {
//
//                        if let rows = dictionary["rows"] as? [Dictionary<String, AnyObject>] {
//
//                            for object in rows {
//
//                                if let value = object["value"] as? Dictionary<String, AnyObject> {
//
//                                    let car = Car()
//                                    car.id = value["_id"] as? String
//                                    car.rev = value["_rev"] as? String
//                                    car.manufacturer = value["manufacturer"] as? String
//                                    car.model = value["model"] as? String
//                                    car.secondHand = (value["secondHand"] as? Bool)!
//                                    car.summary = value["summary"] as? String
//                                    car.year = value["year"] as? String
//                                    car.horsepower = Int32(value["horsepower"] as! Int)
//
//                                    cars.append(car)
//
//                                }
//                            }
//                        }
//                    }
//
//                    success(cars)
//                }
//            } else {
//                print("Error!")
//                print("Error message: " + (response.result.error?.localizedDescription)!)
//
//                failure()
//            }
//
//        }
//
//    }

