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
    func backgraundView(blur: Bool, darkMode: Bool)-> UIView! { //backgraundView(blur: Bool, darkMode: Bool) backgraundView()->
        var blurEffect = UIBlurEffect()
        switch darkMode {
        case true:
            blurEffect = UIBlurEffect(style: .dark)
        case false:
            blurEffect = UIBlurEffect(style: .light)
        }
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "launchScreen.png")
            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        if blur != false { backgroundImage.addSubview(blurView)}
        return backgroundImage
    }
    func backgroundImage(nameImage: String) -> UIView!{
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: nameImage)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        return backgroundImage
    }
    func blurringScreen() -> UIView!{
        var blurEffect = UIBlurEffect()
        let userDef = UserDefaults.standard
        let DarkMode = userDef.bool(forKey: "DarkMode")
        switch DarkMode {
        case true:
            blurEffect = UIBlurEffect(style: .dark)
            print("Black View")
        case false:
            blurEffect = UIBlurEffect(style: .light)
            print("White View")
        }
        print(blurEffect)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
}
extension UIViewController {
    func darkThemeColor() {
        
    }
}
