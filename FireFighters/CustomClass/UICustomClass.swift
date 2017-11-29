//
//  UICustomClass.swift
//  FireFighters
//
//  Created by Павел Уланов on 28.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import Foundation
import UIKit

class UICustomClass{
    func CustomButton(nameBut: String, buttons: UIButton){
        buttons.layer.cornerRadius = 10
        buttons.backgroundColor = UIColor.red
        buttons.setTitle(nameBut, for: .normal)
        buttons.tintColor = UIColor.black
    }
    func CustomTextField(textField: UITextField){
        
    }
    
}
