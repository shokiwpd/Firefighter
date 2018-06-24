//
//  CustomImage.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func circleImage(){
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
