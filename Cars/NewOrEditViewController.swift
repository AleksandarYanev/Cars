//
//  NewOrEditViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class NewOrEditViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var carPickerView: UIPickerView!
    @IBOutlet weak var carPickerBtnView: UIButton!
    
    
    
    var car: Car?
    
    let manufactArray = ["Audi", "Bmw", "Citroen", "Opel", "Peugeot", "Volkswagen", "Volvo"]
    var selectedManufacturer = "Citroen"
    
    func presetValues(withObject object: Car) {
        selectedManufacturer = object.manufacturer
    }
    
    func presetDefaultValues() {
        carPickerBtnView.setTitle(selectedManufacturer, for: UIControlState.normal)
        if let index = manufactArray.index(of: selectedManufacturer) {
            
            carPickerView.selectRow(index, inComponent: 0, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.title = "New Car / Edit Car"
        carPickerView.dataSource = self
        carPickerView.delegate = self
        
        if car != nil {
            presetValues(withObject: car!)
        }
        
        presetDefaultValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func manufactBtnPressed(_ sender: UIButton) {
        
  
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manufactArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manufactArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        carPickerBtnView.setTitle(manufactArray[row], for: UIControlState.normal)
        selectedManufacturer = manufactArray[row]
        heightConstraintCarPickerview.constant = 0
    }
}

