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
    
    @IBAction func loginPressed(_ sender: Any) {
       
        //print(emailTextOutlet.text)
        
        if emailTextOutlet.text == "test@test.com" && passwordFieldOutlet.text == "test123" {
            
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
            
        } else {
            // let alert = UIAlertController(title: "Wrong", message: "wrongwrong", preferredStyle: UIAlertControllerStyle.alert)
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
    
    }

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Login"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
