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
    func keybsoardKey(next: Bool){
        self.autocorrectionType = .yes
        self.borderStyle = .roundedRect
        switch next {
            case true: self.returnKeyType = .next
            case false: self.returnKeyType = .done
        }
    }
}
class textFields: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) || action == #selector(select(_:)) || action == #selector(cut(_:)){
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
 

