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
    @IBOutlet weak var yearPickerView: UIPickerView!
    @IBOutlet weak var carPickerBtnView: UIButton!
    @IBOutlet weak var yearPickerButtonTitle: UIButton!
    @IBOutlet weak var modelLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var manufacturerPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yearPickerHeightConstraint: NSLayoutConstraint!
    
    var car: Car?
    
    let manufactArray = ["Audi", "Bmw", "Citroen", "Opel", "Peugeot", "Volkswagen", "Volvo"]
    var selectedManufacturer = "Citroen"
    let yearsArray = ["2000", "2001", "2002", "2003"]
    
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
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        
        if car != nil {
            presetValues(withObject: car!)
        }
        
        presetDefaultValues()
    }
    
    
    @IBAction func manufactBtnPressed(_ sender: UIButton) {
        
        if(carPickerView.isHidden) {
            // show
            carPickerView.isHidden = false
            manufacturerPickerHeightConstraint.constant = 81
        } else {
            // hide
            carPickerView.isHidden = true
            manufacturerPickerHeightConstraint.constant = 0
        }
        
    }
    
    @IBAction func yearButtonPressed(_ sender: UIButton) {
        
        if(yearPickerView.isHidden) {
            // show
            yearPickerView.isHidden = false
            yearPickerHeightConstraint.constant = 81
        } else {
            // hide
            yearPickerView.isHidden = true
            yearPickerHeightConstraint.constant = 0
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.isEqual(carPickerView) {
            return manufactArray.count
            
        } else if pickerView.isEqual(yearPickerView) {
            return yearsArray.count
        }
        
        return 0 // Horse power pickerview
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(carPickerView) {
            return manufactArray[row]
            
        } else if pickerView.isEqual(yearPickerView) {
            return yearsArray[row]
        }
        return "" // Horse power pickerview
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerView.isEqual(carPickerView) {
            carPickerBtnView.setTitle(manufactArray[row], for: UIControlState.normal)
            selectedManufacturer = manufactArray[row]
            
        } else if pickerView.isEqual(yearPickerView) {
            yearPickerButtonTitle.setTitle(yearsArray[row], for: UIControlState.normal)
          //  selectedManufacturer = manufactArray[row] // Select a default value
            
        } else {
             // Horse power pickerview
        }
       
    }
}

