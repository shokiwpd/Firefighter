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
    func customButtonColor(radius:CGFloat,nameBut: String, titleColor: UIColor, shadowColors: CGColor) {
        self.layer.cornerRadius = self.bounds.height / 2
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.clipsToBounds = true
        self.layer.shadowColor = shadowColors
        self.layer.shadowOpacity = 2.0
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    func customButtonClear(buttonColor: UIColor,radius: CGFloat,borderColors: CGColor,shadowColors: CGColor,nameBut: String){
        self.backgroundColor = buttonColor
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColors
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.shadowColor = shadowColors
        self.layer.shadowOpacity = 1.0
        self.setTitle(nameBut, for: .normal)
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

