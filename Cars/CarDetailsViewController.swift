//
//  CarDetailsViewController.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/18/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {

    var car: Car
    
    @IBOutlet weak var imageCarDetail: UIImageView!
    @IBOutlet weak var manufacturerOutlet: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Car Details"
        
        
        
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
