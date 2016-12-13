//
//  LoginViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextOutlet: UITextField!
    @IBOutlet weak var passwordFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Login"
        
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
        
        defaults.set(emailTextOutlet.text, forKey: "userNameKey")
        defaults.set(passwordFieldOutlet.text, forKey: "passwordKey")
        defaults.set(true, forKey: "isLogged")
        
        defaults.synchronize()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        if emailTextOutlet.text == "test@test.com" && passwordFieldOutlet.text == "test123" {
            
            saveLogin()
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController, animated: true)
            
        } else if emailTextOutlet.text == "" || passwordFieldOutlet.text == "" {
            
            let alert = UIAlertController(title: "Warning", message: "All fields are required!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Warning", message: "Wrong email or password!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
