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
    func layOutSettingTextField(_ top: NSLayoutAnchor<NSLayoutYAxisAnchor>?,
                                _ topConst: CGFloat,
                                _ leading:NSLayoutAnchor<NSLayoutXAxisAnchor>?,
                                _ leadingConst: CGFloat,
                                _ trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>?,
                                _ trailingConst: CGFloat,
                                _ bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?,
                                _ bottomConst: CGFloat){
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConst).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConst).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConst).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConst).isActive = true
        }
        
    }
    
    func topTextField(_ top: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ con: CGFloat){
        topAnchor.constraint(equalTo: top, constant: con).isActive = true
    }
    func leadingTextField(_ leading:NSLayoutAnchor<NSLayoutXAxisAnchor>,_ con: CGFloat){
        leadingAnchor.constraint(equalTo: leading, constant: con).isActive = true
    }
    func trailingTextField(_ trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>,_ con:CGFloat){
        trailingAnchor.constraint(equalTo: trailing, constant: con).isActive = true
    }
    func bottomTextField(_ bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>,_ con: CGFloat){
        bottomAnchor.constraint(equalTo: bottom, constant: con).isActive = true
    }
    func heightTextField(_ h: CGFloat){
        heightAnchor.constraint(equalToConstant: h).isActive = true
    }
    func widthTextField(_ w: CGFloat){
        widthAnchor.constraint(equalToConstant: w).isActive = true
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
public class profileEdithText: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .roundedRect
        keyboardType = .default
        textAlignment = .center
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        textFieldDarkTheme()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func addLines(w: CGFloat){
        let layer = CAShapeLayer()
            layer.fillColor = nil
            layer.lineCap = convertToCAShapeLayerLineCap("miter")
            layer.lineWidth = 2
            layer.darkThemeLayer()
            layer.strokeEnd = 1
       
        self.backgroundColor = UIColor.clear
        self.borderStyle = .none
        
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: 40.0))
        patching.addLine(to: CGPoint(x: w, y: 40.0))
        layer.path = patching.cgPath
        self.layer.addSublayer(layer)
    }
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) || action == #selector(select(_:)) || action == #selector(cut(_:)){
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }

}
fileprivate func convertToCAShapeLayerLineCap(_ input: String) -> CAShapeLayerLineCap {
    return CAShapeLayerLineCap(rawValue: input)
}

