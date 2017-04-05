//
//  CarDetailsViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageCarDetail: UIImageView!
    @IBOutlet weak var manufacturerOutlet: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var secondHandLabel: UILabel!
    
    var cars : Array<Car>!
    var index : Int!
    var car : Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    	    self.navigationItem.title = "Car Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let cars = self.cars, let index = self.index {
            car = cars[index]
            
            manufacturerOutlet.text = "Manufacturer: \(car.manufacturer!)"
            imageCarDetail.image = car.image! as? UIImage
            modelLabel.text = "Model: \(car.model!)"
            hpLabel.text = "Horse power: \(car.horsepower)"
            yearLabel.text = "Year: \(car.year!)"
            summaryLabel.text = "\(car.summary!)"
            secondHandLabel.text = "Second hand: \(car.secondHand)"
            
            if !car.secondHand {
                secondHandLabel.text = "Second hand: No"
            } else {
                secondHandLabel.text = "Second hand: Yes"
            }
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
        
        if car != nil {
            Cars().deleteCarOnServer(carID: car.id!, carRev: car.rev!, success: { (result) in
                
                if result == false {
                    print("The object can't be deleted.")
                } else {
                    
                    appDelegate.saveContext()
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
            }, failure: {
                print("The object can't be deleted.")
            })
        }
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if let editVC = storyboard?.instantiateViewController(withIdentifier: "NewOrEditViewController") as? NewOrEditViewController {
            editVC.cars = cars
            editVC.index = index
            navigationController?.pushViewController(editVC, animated: true)
        }
    }
}
