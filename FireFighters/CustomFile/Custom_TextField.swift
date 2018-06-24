//
//  CustomTextField.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func lineToTextField(shape: CAShapeLayer) {
        self.backgroundColor = UIColor.clear
        self.borderStyle = .none
        shape.frame = self.bounds
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: self.frame.size.height))
        patching.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        shape.path = patching.cgPath
        self.layer.addSublayer(shape)
    }
}
