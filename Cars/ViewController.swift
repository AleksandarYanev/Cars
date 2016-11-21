//
//  ViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/17/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    var cars = Array<Car>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Cars"
     
        tableView.delegate = self
        tableView.dataSource = self
    
        
        let audiA6 = createCar(manufacturer: "Audi", model: "A6", year: "2006", hp: 224, summary: "Originally in 1885, automobile company Wanderer was established, later becoming a branch of Audi AG.", secondHand: false, imagePath: "audi_a6_2006.jpg")
        
        let audiA4 = createCar(manufacturer: "Audi", model: "A4", year: "2010", hp: 200, summary: "The Audi A4 is a line of compact executive cars produced since late 1994 by the German car manufacturer Audi, a subsidiary of the Volkswagen Group.", secondHand: false, imagePath: "audi_a4_2010.jpg")

        let bmwM3 = createCar(manufacturer: "BMW", model: "M3", year: "2016", hp: 450, summary: "The BMW M3 is a sport sedan version of the BMW 3 Series, developed by BMW's in-house motorsport division, BMW M.", secondHand: false, imagePath: "bmw_m3_2016.jpg")
        
        let bmwX5 = createCar(manufacturer: "BMW", model: "X5", year: "2013", hp: 381, summary: "The BMW X5 is a mid-size luxury sport utility vehicle (SUV) produced by BMW.", secondHand: false, imagePath: "bmw_x5_2013.jpg")
        
        let peugeot307 = createCar(manufacturer: "Peugeot", model: "307", year: "2002", hp: 90, summary: "The Peugeot 307 is a small family car produced by the French manufacturer Peugeot since 2001, following the Peugeot 306 which ceased production in 2002.", secondHand: false, imagePath: "peugeot_307_2002.jpg")
        
        let peugeot407 = createCar(manufacturer: "Peugeot", model: "407", year: "2004", hp: 136, summary: "The Peugeot 407 is a large family car produced by the French automaker Peugeot from 2004 to 2010.", secondHand: false, imagePath: "peugeot_407_2004.jpg")
        
        let vwPassat = createCar(manufacturer: "Volkswagen", model: "Passat", year: "2015", hp: 220, summary: "The Volkswagen Passat (About this sound listen (help·info)) is a large family sedan produced by the German manufacturer Volkswagen since 1973, through eight design generations.", secondHand: false, imagePath: "vw_passat_2015.jpg")
        
        let vwPolo = createCar(manufacturer: "Volkswagen", model: "Polo", year: "2006", hp: 90, summary: "The Volkswagen Polo is a supermini car produced by the German manufacturer Volkswagen since 1975.", secondHand: false, imagePath: "vw_polo_2006.jpg")
        
        let volvoC70 = createCar(manufacturer: "Volvo", model: "C70", year: "2005", hp: 177, summary: "The Volvo C70 is a two-door, four-passenger compact manufactured and marketed by Volvo Cars from 1996 to 2013 across two generations.", secondHand: false, imagePath: "volvo_c70_2005.jpg")
        
        cars.append(audiA6)
        cars.append(audiA4)
        cars.append(bmwM3)
        cars.append(bmwX5)
        cars.append(peugeot307)
        cars.append(peugeot407)
        cars.append(vwPassat)
        cars.append(vwPolo)
        cars.append(volvoC70)
        
        //cars.append(createCar(manufacturer: "Audi", model: "A6", year: "2006", hp: 224, summary: "Originally in 1885, automobile company Wanderer was established, later becoming a branch of Audi AG.", secondHand: false, imagePath: "audi_a6_2006.jpg"))
    }
    
    func createCar(manufacturer:String, model:String, year:String, hp:Int, summary:String, secondHand:Bool, imagePath:String) -> Car {
        let car = Car()
        
        car.manufacturer = manufacturer
        car.model = model
        car.year = year
        car.hp = hp
        car.summary = summary
        car.secondHand = secondHand
        car.imagePath = imagePath
        
        return car
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cars.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarViewClass
        
        cell.carImages.image = UIImage(named: cars[indexPath.row].imagePath)
        cell.brandView.text = cars[indexPath.row].manufacturer
        cell.modelView.text = cars[indexPath.row].model
        cell.yearView.text = cars[indexPath.row].year
        
        return cell
    }
    

}
