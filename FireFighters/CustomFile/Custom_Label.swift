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
        case 548.0...568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 50)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 70)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 85)//iPhone 6+,7+,8+
        case 792.0...812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 75)//iPhone X,XS,XR,11 Pro,11 Pro Max
        case 876.0...896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 85)//iPhone XS_Max,11
        case 1004.0...1024.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//Air 1,2
        case 1346.0...1366.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 250)// Pro 12.2
        case 1174.0...1194.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 200)// Pro 11
        case 1092.0...1112.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 200)// Pro 10.5
            
        default: print("_____")
        }
    }
    func LoginLabel(viewHeight: Double) {
        switch viewHeight {
        case 548.0...568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 55)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 70)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 80)//iPhone 6+,7+,8+
        case 792.0...812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 68)//iPhone X
        case 876.0...896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 68)//iPhone XS_Max
        case 1004.0...1024.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        default: print("_____")
        }
    }
    func CellLabelName(viewHeight: Double) {
        switch viewHeight {
        case 548.0...568.0:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)//iPhone 6+,7+,8+
        case 792.0...812.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)//iPhone X
        case 876.0...896.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)//iPhone XS_Max
        case 1004.0...1024.0:
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        default: print("_____")
        }
    }
    func CellLabelOptional(viewHeight: Double) {
        switch viewHeight {
        case 548.0...568.0:
            self.font = UIFont.systemFont(ofSize: 15, weight: .bold)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)//iPhone 6+,7+,8+
        case 792.0...812.0:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)//iPhone X
        case 876.0...896.0:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)//iPhone XS_Max
        default: print("_____")
        }
    }
    func sizeLabel(height: Double){
        switch height {
            case 548.0...568.0:
                self.font = UIFont.systemFont(ofSize: 20)
            default:
                self.font = UIFont.systemFont(ofSize: 30)
        }
    }
}
