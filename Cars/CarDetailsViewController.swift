//
//  CarDetailsViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {

    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
       // Delete button not finished
        if let deleteBtn = storyboard?.instantiateViewController(withIdentifier: "addEditVC") {
            navigationController?.pushViewController(deleteBtn, animated: true)
        }
        
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
    
        if let editVC = storyboard?.instantiateViewController(withIdentifier: "addEditVC") as? NewOrEditViewController {
            editVC.car = car
            navigationController?.pushViewController(editVC, animated: true)
        }
        
    }
    
    var car: Car?
    
    @IBOutlet weak var imageCarDetail: UIImageView!
    @IBOutlet weak var manufacturerOutlet: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var secondHandLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Car Details"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       if let car = car {
            manufacturerOutlet.text = "Manufacturer: \(car.manufacturer)"
            imageCarDetail.image = UIImage(named: (car.imagePath))
            modelLabel.text = "Model: \(car.model)"
            hpLabel.text = "Horse power: \(car.hp)"
            yearLabel.text = "Year: \(car.year)"
            summaryLabel.text = "\(car.summary)"
            secondHandLabel.text = "Second hand: \(car.secondHand)"
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
