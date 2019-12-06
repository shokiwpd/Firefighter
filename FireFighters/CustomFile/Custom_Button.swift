//
//  CustomButton.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    func grayButton(nameBut: String) {
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.darkGray, for: .highlighted)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 2.0
//        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    func clearButton(nameBut: String){
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.borderColor =  UIColor.gray.cgColor
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }

}

extension CAGradientLayer {
    func gardientButton(w: CGFloat, h: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: w, height: h)
        self.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
       
    }
}

