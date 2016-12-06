//
//  NewOrEditViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class NewOrEditViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var newCarImageView: UIImageView!
    @IBOutlet weak var horsePowerPickerView: UIPickerView!
    @IBOutlet weak var carPickerView: UIPickerView!
    @IBOutlet weak var yearPickerView: UIPickerView!
    @IBOutlet weak var carPickerBtnView: UIButton!
    @IBOutlet weak var yearPickerButtonTitle: UIButton!
    @IBOutlet weak var modelLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var manufacturerPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yearPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var horsePowerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var horsePowerButtonTitle: UIButton!
    
    var car: Car?
    var comingFromAddActionButton = false
    var comingFromEditActionButton = false
    
    let manufactArray = ["Audi", "Bmw", "Citroen", "Opel", "Peugeot", "Volkswagen", "Volvo"]
    var selectedManufacturer = "Citroen"
    let yearsArray = ["1980", "2000", "2001", "2002", "2003"]
    var selectedYear = "2000"
    let horsePowerArray = [123, 456, 789, 155, 300, 200]
    var selectedHorsePower = 90
    
    
    func presetValues(withObject object: Car) {
        selectedManufacturer = object.manufacturer
        selectedYear = object.year
        selectedHorsePower = object.hp
    }
    
    func presetDefaultValues() {
        carPickerBtnView.setTitle(selectedManufacturer, for: UIControlState.normal)
        if let index = manufactArray.index(of: selectedManufacturer) {
            
            carPickerView.selectRow(index, inComponent: 0, animated: true)
        }
        
        yearPickerButtonTitle.setTitle(selectedYear, for: UIControlState.normal)
        if let index = yearsArray.index(of: selectedYear) {
            
            yearPickerView.selectRow(index, inComponent: 0, animated: true)
        }
        horsePowerButtonTitle.setTitle("\(selectedHorsePower)", for: UIControlState.normal)
        if let index = horsePowerArray.index(of: selectedHorsePower) {
            
            horsePowerPickerView.selectRow(index, inComponent: 0, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carPickerView.dataSource = self
        carPickerView.delegate = self
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        horsePowerPickerView.dataSource = self
        horsePowerPickerView.delegate = self
        
        if car != nil {
            presetValues(withObject: car!)
        }
        
        presetDefaultValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if comingFromAddActionButton == true {
            
            newCarImageView.image = UIImage(named: "new_car_image.jpg")
            
        } else if comingFromEditActionButton == true {
            
            newCarImageView.image = UIImage(named: (car?.imagePath)!)
        }
        
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
    
    @IBAction func horsePowerButtonPressed(_ sender: UIButton) {
        
        if(horsePowerPickerView.isHidden) {
            // show
            horsePowerPickerView.isHidden = false
            horsePowerHeightConstraint.constant = 81
        } else {
            // hide
            horsePowerPickerView.isHidden = true
            horsePowerHeightConstraint.constant = 0
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
            
        } else {
            horsePowerPickerView.isEqual(horsePowerPickerView)
            return horsePowerArray.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(carPickerView) {
            return manufactArray[row]
            
        } else if pickerView.isEqual(yearPickerView) {
            return yearsArray[row]
            
        } else {
            return "\(horsePowerArray[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.isEqual(carPickerView) {
            carPickerBtnView.setTitle(manufactArray[row], for: UIControlState.normal)
            selectedManufacturer = manufactArray[row]
            hidePicker(pickerView: carPickerView, heightConstraint: manufacturerPickerHeightConstraint)
            
        } else if pickerView.isEqual(yearPickerView) {
            yearPickerButtonTitle.setTitle(yearsArray[row], for: UIControlState.normal)
            selectedYear = yearsArray[row]
            hidePicker(pickerView: yearPickerView, heightConstraint: yearPickerHeightConstraint)
        }
        
        if  pickerView.isEqual(horsePowerPickerView) {
            horsePowerButtonTitle.setTitle("\(horsePowerArray[row])", for: UIControlState.normal)
            selectedHorsePower = horsePowerArray[row]
            hidePicker(pickerView: horsePowerPickerView, heightConstraint: horsePowerHeightConstraint)
            
        }
        
    }
    
    func hidePicker(pickerView: UIPickerView, heightConstraint: NSLayoutConstraint) {
        pickerView.isHidden = true
        heightConstraint.constant = 0
        
    }
}
