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
    @IBOutlet weak var modelTextField: UITextField!
    
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
        
        carPickerView.dataSource = self
        carPickerView.delegate = self
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        horsePowerPickerView.dataSource = self
        horsePowerPickerView.delegate = self
        
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
    }
    
    func presetValues(withCar : Car) {
        
        let manufacturer = withCar.manufacturer
        let year = withCar.year
        let horsePower = withCar.hp
        
        carPickerBtnView.setTitle(manufacturer, for: .normal)
        yearPickerButtonTitle.setTitle(year, for: .normal)
        horsePowerButtonTitle.setTitle(String(horsePower), for: .normal)
        
        selectedManufacturer = withCar.manufacturer
        selectedYear = withCar.year
        selectedHorsePower = withCar.hp
    }
    
    func presetNoCarValues() {
        
        let manufacturer = "Manufacturer"
        let year = "Year"
        let horsePower = "Horsepower"
        
        carPickerBtnView.setTitle(manufacturer, for: .normal)
        yearPickerButtonTitle.setTitle(year, for: .normal)
        horsePowerButtonTitle.setTitle(String(horsePower), for: .normal)
        
        selectedManufacturer = "Audi"
        selectedYear = "2006"
        selectedHorsePower = 224
    }
    
    func initiateValues() {
        if let index = manufactArray.index(of: selectedManufacturer) {
            carPickerView.selectRow(index, inComponent: 0, animated: true)
        }
        if let index = yearsArray.index(of: selectedYear) {
            yearPickerView.selectRow(index, inComponent: 0, animated: true)
        }
        if let index = horsePowerArray.index(of: selectedHorsePower) {
            horsePowerPickerView.selectRow(index, inComponent: 0, animated: true)
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
    
    @IBAction func saveButton(_ sender: Any) {
        
        if modelTextField.text == "" || carPickerBtnView.title(for: .normal) == "Manufacturer" || yearPickerButtonTitle.title(for: .normal) == "Year" || horsePowerButtonTitle.title(for: .normal) == "Horsepower" {
            
            let alert = UIAlertController(title: "Warning", message: "All fields are required!", preferredStyle: UIAlertControllerStyle.alert)
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
        if pickerView.isEqual(carPickerView) {
            return manufactArray.count
            
        } else if pickerView.isEqual(yearPickerView) {
            return yearsArray.count
            
        } else {
            pickerView.isEqual(horsePowerPickerView)
            return horsePowerArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(carPickerView) {
            return manufactArray[row]
            
        } else if pickerView.isEqual(yearPickerView) {
            return yearsArray[row]
            
        } else { pickerView.isEqual(horsePowerPickerView)
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
