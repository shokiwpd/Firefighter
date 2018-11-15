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
extension UITabBar {
    func darkThemeBar() {
        let theme = ThemeUser()
        switch theme.DarkTheme(userSelect: "Диначмиеская") {
        case "Dark":
            self.barStyle = .black
        case "White":
            self.barStyle = .default
        default:
            print("error")
        }
    }
}
extension UINavigationBar {
    func darkThemeNav() {
        let theme = ThemeUser()
        switch theme.DarkTheme(userSelect: "Диначмиеская") {
        case "Dark":
            self.barStyle = .black
            self.barTintColor = UIColor.black
        case "White":
            self.barStyle = .default
            self.barTintColor = UIColor.white
        default:
            print("error")
        }
    }
}
