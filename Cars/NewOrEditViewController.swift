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
    @IBOutlet weak var horsepowerPicker: UIPickerView!
    @IBOutlet weak var manufacturerPicker: UIPickerView!
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var manufacturerButton: UIButton!
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var manufacturerPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yearPickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var horsePowerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var horsepowerButton: UIButton!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var switchTurnSecondHand: UISwitch!
    
    var car: Car?
    var isEditMode: Bool!
    var cars : NSMutableArray!
    var index : Int!
    
    let manufactArray = ["Audi", "Bmw", "Citroen", "Opel", "Peugeot", "Volkswagen", "Volvo"]
    var selectedManufacturer = "Citroen"
    var yearsArray = [String]()
    var selectedYear = "2000"
    var horsePowerArray = [Int]()
    var selectedHorsePower = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manufacturerPicker.dataSource = self
        manufacturerPicker.delegate = self
        yearPicker.dataSource = self
        yearPicker.delegate = self
        horsepowerPicker.dataSource = self
        horsepowerPicker.delegate = self
        
        if let cars = self.cars, let index = self.index {
            car = cars[index] as? Car
        }
        
        if car != nil {
            isEditMode = true
            presetValues(withCar: car!)
        } else {
            isEditMode = false
            presetNoCarValues()
        }
        
        initiateValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isEditMode! {
            
            self.navigationItem.title = "Edit Car"
            newCarImageView.image = UIImage(named: (car?.imagePath)!)
            
        } else if !isEditMode {
            
            self.navigationItem.title = "New Car"
            newCarImageView.image = UIImage(named: "new_car_image.jpg")
        }
        
        for yearNumber in 1980...2016 {
            yearsArray.append("\(yearNumber)")
        }
        
        for horsepowerNumber in 50...500 {
            horsePowerArray.append(horsepowerNumber)
        }
        
        if car!.secondHand {
            switchTurnSecondHand.isOn = true
        } else {
            switchTurnSecondHand.isOn = false
        }
        
    }
    
//    func setSummaryText(withText: Car) {
//            
//        }
//    }
    
    func presetValues(withCar : Car) {
        
        let manufacturer = withCar.manufacturer
        let year = withCar.year
        let horsePower = withCar.hp
        
        manufacturerButton.setTitle(manufacturer, for: .normal)
        yearButton.setTitle(year, for: .normal)
        horsepowerButton.setTitle(String(horsePower), for: .normal)
        
        selectedManufacturer = withCar.manufacturer
        selectedYear = withCar.year
        selectedHorsePower = withCar.hp
    }
    
    func presetNoCarValues() {
        
        let manufacturer = "Manufacturer"
        let year = "Year"
        let horsePower = "Horsepower"
        
        manufacturerButton.setTitle(manufacturer, for: .normal)
        yearButton.setTitle(year, for: .normal)
        horsepowerButton.setTitle(String(horsePower), for: .normal)
        
        selectedManufacturer = "Audi"
        selectedYear = "2006"
        selectedHorsePower = 224
    }
    
    func initiateValues() {
        if let index = manufactArray.index(of: selectedManufacturer) {
            manufacturerPicker.selectRow(index, inComponent: 0, animated: true)
        }
        if let index = yearsArray.index(of: selectedYear) {
            yearPicker.selectRow(index, inComponent: 0, animated: true)
        }
        if let index = horsePowerArray.index(of: selectedHorsePower) {
            horsepowerPicker.selectRow(index, inComponent: 0, animated: true)
        }
    }
    
    func hidePicker(pickerView: UIPickerView, heightConstraint: NSLayoutConstraint) {
        pickerView.isHidden = true
        heightConstraint.constant = 0
    }
    
    func showPicker(pickerView: UIPickerView, heightConstraint: NSLayoutConstraint) {
        pickerView.isHidden = false
        heightConstraint.constant = 81
    }
    
    @IBAction func manufacturerButttonPressed(_ sender: UIButton) {
        
        if(manufacturerPicker.isHidden) {
            showPicker(pickerView: manufacturerPicker, heightConstraint: manufacturerPickerHeightConstraint)
        } else {
            hidePicker(pickerView: manufacturerPicker, heightConstraint: manufacturerPickerHeightConstraint)
        }
    }
    
    @IBAction func yearButtonPressed(_ sender: UIButton) {
        
        if(yearPicker.isHidden) {
            showPicker(pickerView: yearPicker, heightConstraint: yearPickerHeightConstraint)
        } else {
            hidePicker(pickerView: yearPicker, heightConstraint: yearPickerHeightConstraint)
        }
    }
    
    @IBAction func horsePowerButtonPressed(_ sender: UIButton) {
        
        if(horsepowerPicker.isHidden) {
            showPicker(pickerView: horsepowerPicker, heightConstraint: horsePowerHeightConstraint)
        } else {
            hidePicker(pickerView: horsepowerPicker, heightConstraint: horsePowerHeightConstraint)
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if modelTextField.text == "" || manufacturerButton.title(for: .normal) == "Manufacturer" || yearButton.title(for: .normal) == "Year" || horsepowerButton.title(for: .normal) == "Horsepower" {
            
            let alert = UIAlertController(title: "Warning", message: "Some of mandatory fields are not selected!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            if isEditMode! {
                //save element
            } else {
                //add element
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.isEqual(manufacturerPicker) {
            return manufactArray.count
            
        } else if pickerView.isEqual(yearPicker) {
            return yearsArray.count
            
        } else {
            pickerView.isEqual(horsepowerPicker)
            return horsePowerArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(manufacturerPicker) {
            return manufactArray[row]
            
        } else if pickerView.isEqual(yearPicker) {
            return yearsArray[row]
            
        } else { pickerView.isEqual(horsepowerPicker)
            return "\(horsePowerArray[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.isEqual(manufacturerPicker) {
            manufacturerButton.setTitle(manufactArray[row], for: UIControlState.normal)
            selectedManufacturer = manufactArray[row]
            hidePicker(pickerView: manufacturerPicker, heightConstraint: manufacturerPickerHeightConstraint)
            
        } else if pickerView.isEqual(yearPicker) {
            yearButton.setTitle(yearsArray[row], for: UIControlState.normal)
            selectedYear = yearsArray[row]
            hidePicker(pickerView: yearPicker, heightConstraint: yearPickerHeightConstraint)
        }
        
        if  pickerView.isEqual(horsepowerPicker) {
            horsepowerButton.setTitle("\(horsePowerArray[row])", for: UIControlState.normal)
            selectedHorsePower = horsePowerArray[row]
            hidePicker(pickerView: horsepowerPicker, heightConstraint: horsePowerHeightConstraint)
        }
    }
}
