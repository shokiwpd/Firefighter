//
//  Custom_Label.swift
//  FireFighters
//
//  Created by Павел on 17.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    func UIfontLabel(viewHeight: Double) {
        switch viewHeight {
        case 568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 150)//iPhone 5S,SE
        case 667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone 6,7,8
        case 736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 200)//iPhone 6+,7+,8+
        case 812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone X,XS,XR
        case 896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone XS_Max
        default: print("_____")
        }
    }
    func LoginLabel(viewHeight: Double) {
        switch viewHeight {
        case 568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 55)//iPhone 5S,SE
        case 667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 70)//iPhone 6,7,8
        case 736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 80)//iPhone 6+,7+,8+
        case 812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 68)//iPhone X
        case 896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 68)//iPhone XS_Max
        default: print("_____")
        }
    }
}
