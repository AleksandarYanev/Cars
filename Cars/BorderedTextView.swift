//
//  BorderedTextView.swift
//  Cars
//
//  Created by Aleksandar Yanev on 12/8/16.
//  Copyright © 2016 AleksandarYanev. All rights reserved.
//

import UIKit

class BorderedTextView: UITextView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5.0
    }
}
