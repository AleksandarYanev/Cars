//
//  LoginViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Login"
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        dissmissKeyboardOnTouch()
        setLoginFields()
    }
    
    func setLoginFields() {
        let defaults = UserDefaults.standard
        let hasLogged = defaults.object(forKey: "isLogged") as? Bool
        let userName = defaults.object(forKey: "userNameKey") as? String
        let password = defaults.object(forKey: "passwordKey") as? String
        
        if let isLogged = hasLogged, let userNameField = userName, let passwordField = password {
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
            if isLogged == true && userNameField == "test@test.com" && passwordField == "test123" {
                self.navigationController?.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController"), animated: true)
            }
        }
    }
    
    func saveLogin() {
        let defaults = UserDefaults.standard
        
        defaults.set(usernameTextField.text, forKey: "userNameKey")
        defaults.set(passwordTextField.text, forKey: "passwordKey")
        defaults.set(true, forKey: "isLogged")
        defaults.synchronize()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if usernameTextField.text == "test@test.com" && passwordTextField.text == "test123" {
            
            saveLogin()
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController, animated: true)
            
        } else if usernameTextField.text == "" || passwordTextField.text == "" {
            
            let alert = UIAlertController(title: "Warning", message: "All fields are required!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Warning", message: "Wrong email or password!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func dissmissKeyboardOnTouch() {
        let tapper = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
