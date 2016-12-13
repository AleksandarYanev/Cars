//
//  CarViewClass.swift
//  Cars
//
//  Created by Aleksandar Yanev on 11/17/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImages: UIImageView!
    @IBOutlet weak var brandView: UILabel!
    @IBOutlet weak var modelView: UILabel!
    @IBOutlet weak var yearView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
