//
//  CustomLayer.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    func layerLine(strokeColors: CGColor) {
        self.fillColor = nil
        self.lineCap = "round"
        self.lineWidth = 2
        self.strokeColor = strokeColors
        self.strokeEnd = 1
    }
}
extension CAGradientLayer {
    func gradientsColor(){
        self.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
    }
}
