//
//  CustomView.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func backgraundView()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "launchScreen.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
    func blurringScreen() -> UIView!{
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
    func backgraundRegistration()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "registScreen.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
}
