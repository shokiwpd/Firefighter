//
//  DarkTheme.swift
//  FireFighters
//
//  Created by Павел on 14/11/2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit
class ThemeUser {
    // Функция для работы с темной темы.
func DarkTheme(userSelect: String) -> String {
    var ThemeName = ""
    let todayDate = Date()
    switch userSelect {
        case "Темныя Тема":
            ThemeName = "Dark"
        case "Дневаня Тема":
            ThemeName = "White"
        case "Диначмиеская":
            switch Int(todayDate.HourTime)! {
                case 6...16:
                    ThemeName = "White"
                case 0...5, 17...23:
                    ThemeName = "Dark"
                default:
                    print("nil")
                }
        default:
            print("nil")
        }
     return ThemeName
    }
}
// Функция для работы Таб баром с темной темой.
extension UITabBar {
    func darkThemeBar() {
        let userDef = UserDefaults.standard
        let DarkMode = userDef.bool(forKey: "DarkMode")
        switch DarkMode {
        case true:
            self.barStyle = .black
        case false:
            self.barStyle = .default
        }
    }
}
// Функция для работы панели навигации с темной темой.
extension UINavigationBar {
    func darkThemeNav() {
        let userDef = UserDefaults.standard
        let DarkMode = userDef.bool(forKey: "DarkMode")
        switch DarkMode {
        case true:
//            self.barStyle = .black
            self.barTintColor = UIColor.yellow
        case false:
//            self.barStyle = .default
            self.barTintColor = UIColor.green
        }
    }
}
// Функция для работы текста с темной темой.
extension UILabel {
    func darkThemeLabel() {
        let userDef = UserDefaults.standard
        let DarkMode = userDef.bool(forKey: "DarkMode")
        switch DarkMode {
        case true:
            self.textColor = .white
        case false:
            self.textColor = .black
        }
    }
}
extension UIView {
    func darkThemeView() {
        let userDef = UserDefaults.standard
        let DarkMode = userDef.bool(forKey: "DarkMode")
        switch DarkMode {
        case true:
            self.backgroundColor = .darkGray
        case false:
            self.backgroundColor = .white
        }
    }
}

// system dark theme

