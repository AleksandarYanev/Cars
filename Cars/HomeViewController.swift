//
//  HomeViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/17/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var cars = Array<Car>()
    var carsDownload = Cars()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "Cars"
        
        tableView.delegate = self
        tableView.dataSource = self

//        getCars()

//        if cars.count > 0 {
//
//            tableView.reloadData()
//        } else {
//            loadCarsData()
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        carsDownload.requestAndMapCars(success: { (response) in
            self.cars.removeAll()
            if let rows = response.rows {
            
            for row in rows {
                
                let car = Car(context: context)
                
                car.id = row.value?.id
                car.rev = row.value?.rev
                car.manufacturer = row.value?.manufacturer
                car.model = row.value?.model
                car.secondHand = row.value?.secondHand ?? false
                car.summary = row.value?.summary
                car.year = row.value?.year
                car.horsepower = row.value?.horsepower ?? 0
                car.image = UIImage(named: "new_car_image")
                
                self.cars.append(car)
                
                
                }
                appDelegate.saveContext()
                self.tableView.reloadData()
            }
            
        }, failure: {
            
            let alert = UIAlertController(title: "Error", message: "There is no data downloaded!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue offline", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("error")
             self.getCars()
            self.tableView.reloadData()
        })
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil

       
       // tableView.reloadData()
    }

    func loadCarsData() {
        createCar(manufacturer: "Audi", model: "A6", year: "2006", hp: 224, summary: "Originally in 1885, automobile company Wanderer was established, later becoming a branch of Audi AG.", secondHand: true, imagePath: "audi_a6_2006.jpg")

        createCar(manufacturer: "Audi", model: "A4", year: "2010", hp: 200, summary: "The Audi A4 is a line of compact executive cars produced since late 1994 by the German car manufacturer Audi, a subsidiary of the Volkswagen Group.", secondHand: true, imagePath: "audi_a4_2010.jpg")

        createCar(manufacturer: "BMW", model: "M3", year: "2016", hp: 450, summary: "The BMW M3 is a sport sedan version of the BMW 3 Series, developed by BMW's in-house motorsport division, BMW M.", secondHand: false, imagePath: "bmw_m3_2016.jpg")

        createCar(manufacturer: "BMW", model: "X5", year: "2013", hp: 381, summary: "The BMW X5 is a mid-size luxury sport utility vehicle (SUV) produced by BMW.", secondHand: true, imagePath: "bmw_x5_2013.jpg")

        createCar(manufacturer: "Peugeot", model: "307", year: "2002", hp: 90, summary: "The Peugeot 307 is a small family car produced by the French manufacturer Peugeot since 2001, following the Peugeot 306 which ceased production in 2002.", secondHand: true, imagePath: "peugeot_307_2002.jpg")

        createCar(manufacturer: "Peugeot", model: "407", year: "2004", hp: 136, summary: "The Peugeot 407 is a large family car produced by the French automaker Peugeot from 2004 to 2010.", secondHand: true, imagePath: "peugeot_407_2004.jpg")

        createCar(manufacturer: "Volkswagen", model: "Passat", year: "2015", hp: 220, summary: "The Volkswagen Passat (About this sound listen (help·info)) is a large family sedan produced by the German manufacturer Volkswagen since 1973, through eight design generations.", secondHand: false, imagePath: "vw_passat_2015.jpg")

        createCar(manufacturer: "Volkswagen", model: "Polo", year: "2006", hp: 90, summary: "The Volkswagen Polo is a supermini car produced by the German manufacturer Volkswagen since 1975.", secondHand: true, imagePath: "vw_polo_2006.jpg")

        createCar(manufacturer: "Volvo", model: "C70", year: "2005", hp: 177, summary: "The Volvo C70 is a two-door, four-passenger compact manufactured and marketed by Volvo Cars from 1996 to 2013 across two generations.", secondHand: true, imagePath: "volvo_c70_2005.jpg")

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "openAddCarSegue" {

            if segue.destination is NewOrEditViewController {
                let viewController = segue.destination as? NewOrEditViewController
                viewController?.cars = cars
            }
        }
    }

    func createCar(manufacturer:String, model:String, year:String, hp:Int, summary:String, secondHand:Bool, imagePath:String) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let car = Car(context: context)

        car.manufacturer = manufacturer
        car.model = model
        car.year = year
        car.horsepower = Int32(hp)
        car.summary = summary
        car.secondHand = secondHand
        car.image = UIImage(named: imagePath)

        do {
            try context.save()
        }
        catch {

            print(error)
        }
    }

    func getCars() {

        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        do {

            self.cars = try context.fetch(fetchRequest)

        } catch {

            print(error)
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell

        let car = cars[indexPath.row]

        cell.carImages.image = car.image as? UIImage
        cell.brandView.text = car.manufacturer
        cell.modelView.text = car.model
        cell.yearView.text = car.year

        cell.selectionStyle = UITableViewCellSelectionStyle.none

        return cell
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let car = cars[indexPath.row]

        if editingStyle == .delete {
            
            if let carID = car.id, let carRev = car.rev {
            
                Cars().deleteCarOnServer(carID: carID, carRev: carRev, success: { (result) in
                
                if result.ok == false {
                    print("The object can't be deleted.")
                }
                
            }, failure: {
                print("The object can't be deleted.")
            })
            }
            context.delete(car)
            appDelegate.saveContext()
            cars.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsVC") as! CarDetailsViewController
        carsViewController.cars = cars
        carsViewController.index = indexPath.row

        self.navigationController?.pushViewController(carsViewController, animated: true)
    }
}
