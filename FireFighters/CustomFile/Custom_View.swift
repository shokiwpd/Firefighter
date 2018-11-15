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
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        return backgroundImage
    }
    
    func blurringScreen() -> UIView!{
        let theme = ThemeUser()
        var blurEffect = UIBlurEffect()
        if theme.DarkTheme(userSelect: "Диначмиеская") == "Dark"{
             blurEffect = UIBlurEffect(style: .dark)
        } else if theme.DarkTheme(userSelect: "Диначмиеская") == "White"{
             blurEffect = UIBlurEffect(style: .light)
        }
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
}
