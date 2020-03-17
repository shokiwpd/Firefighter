//
//  Custom_Colors.swift
//  FireFighters
//
//  Created by Павел on 02/10/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //dark theme
    @available(iOS 13.0, *)
    static let newDarkTheme = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)
        } else {
            return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9647058824, alpha: 1)
        }
    }
    //revers Dark theme
    @available(iOS 13.0, *)
    static let reversDark = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9647058824, alpha: 1)
        } else {
            return #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)
        }
    }
    @available(iOS 13.0, *)
    static let navigationDark = UIColor { (train: UITraitCollection) -> UIColor in
        if train.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)
        } else {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}
