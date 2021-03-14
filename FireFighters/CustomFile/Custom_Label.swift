//
//  Custom_Label.swift
//  FireFighters
//
//  Created by Павел on 17.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import iosMath
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
        case 926.0...946:
            self.font = UIFont(name:  "signpainter-housescript", size: 80)//iPhone 12 Max Pro
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
    func layOutSettingLabel(_ top: NSLayoutAnchor<NSLayoutYAxisAnchor>?,
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
    func topLabel(_ top: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ con: CGFloat){
        topAnchor.constraint(equalTo: top, constant: con).isActive = true
    }
    func leadingLabel(_ leading:NSLayoutAnchor<NSLayoutXAxisAnchor>,_ con: CGFloat){
        leadingAnchor.constraint(equalTo: leading, constant: con).isActive = true
    }
    func trailingLabel(_ trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>,_ con:CGFloat){
        trailingAnchor.constraint(equalTo: trailing, constant: con).isActive = true
    }
    func bottomLabel(_ bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>,_ con: CGFloat){
        bottomAnchor.constraint(equalTo: bottom, constant: con).isActive = true
    }
    func heightLabel(_ h: CGFloat){
        heightAnchor.constraint(equalToConstant: h).isActive = true
    }
    func widthLabel(_ w: CGFloat){
        widthAnchor.constraint(equalToConstant: w).isActive = true
    }
    
}

public class calculationLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        settingUILabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settingUILabel()
    }
    
    func settingUILabel() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        self.darkThemeLabel()
    }
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                    self.darkThemeLabel()
            }
        }
    }
}
extension MTMathUILabel {
    func fontSettingMTM(_ dView: Double) {
        switch dView {
        case 548.0...568.0:
            fontSize = 15
        default: fontSize = 20
        }
    }
}

public class calculationMTMlabel: MTMathUILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        settingMTMUIlabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settingMTMUIlabel()
    }
    
    func settingMTMUIlabel() {
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        self.darkMathLabel()
    }
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                    self.darkMathLabel()
            }
        }
    }
}
