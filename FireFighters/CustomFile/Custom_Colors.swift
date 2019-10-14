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
    @available(iOS 13.0, *)
    static let newDarkTheme = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return .black
        } else {
            return .white
        }
    }
    @available(iOS 13.0, *)
    static let newLabelDark = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return .white
        } else {
            return .black
        }
    }
}
