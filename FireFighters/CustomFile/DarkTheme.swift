//
//  DarkTheme.swift
//  FireFighters
//
//  Created by Павел on 14/11/2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit
import iosMath

/* Файл для работы с темной темой
 
Данный файл полностью работает с темной темой
Инструкция по работе с темной темой:
 0 - работает только с 13 версией операционной системы
 1 - тёмная тема работает со всеми версиями iOS
 2 - светлая тема работает со всеми версиями iOS
 
 */
// Функция для работы текста с темной темой.

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

// Dark theme to UIView all work
extension UIView {
    func viewThemeColor() {
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
            if themeSelect == 1 {
                self.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)
            } else if themeSelect == 2 {
                self.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            } else if themeSelect == 0{
                if #available(iOS 13.0, *) {
                    self.backgroundColor = UIColor.newDarkTheme
                }
            }
        }
}
extension UICollectionViewCell {
    func cellThemeColor() {
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
            if themeSelect == 1 {
                backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else if themeSelect == 2 {
                backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            } else if themeSelect == 0{
                if #available(iOS 13.0, *) {
                backgroundColor = UIColor.pureReversColor
                layer.shadowColor = UIColor.pureColor.cgColor
            }
        }
    }
}

//Dark theme to UINavigationControllers All work
extension UINavigationController {
    func navigatinDarkTheme(){
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
            if themeSelect == 1 {
                self.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
                self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
            } else if themeSelect == 2 {
                self.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
                self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
            } else  if themeSelect == 0 {
                if #available(iOS 13.0, *) {
                    self.navigationBar.backgroundColor = UIColor.navigationDark
                    self.navigationBar.tintColor = UIColor.reversDark
                    self.navigationBar.barTintColor = UIColor.navigationDark
                    self.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.reversDark]
                    self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.reversDark]
                }
            }
        }
    }

// Dark theme to UITabBar all work
extension UITabBarController{
    func tabBarDarkTheme() {
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                self.tabBar.barTintColor = UIColor.navigationDark
            }
        } else if themeSelect == 1 {
            self.tabBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else if themeSelect == 2{
            self.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

extension UILabel {
    func darkThemeLabel() {
        let give = UserDefaults.standard
         let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                textColor = UIColor.reversDark
            }
        } else if themeSelect == 1 {
            textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else if themeSelect == 2 {
            textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

extension MTMathUILabel {
    func darkMathLabel(){
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                textColor = UIColor.reversDark
            }
        } else if themeSelect == 1 {
            textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else if themeSelect == 2 {
            textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
extension UIDatePicker {
    func darkThemeDatePicker(){
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                setValue(UIColor.reversDark, forKey: "textColor")
            }
        } else if themeSelect == 1 {
            setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKey: "textColor")
        } else if themeSelect == 2 {
            setValue(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), forKey: "textColor")

        }

    }
}

extension UITextField {
    func textFieldDarkTheme() {
        let give = UserDefaults.standard
         let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                textColor = UIColor.reversDark
            }
        } else if themeSelect == 1 {
            textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else if themeSelect == 2 {
            textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

extension UIButton {
    func DarkThemeButton() {
        let give = UserDefaults.standard
         let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                backgroundColor = UIColor.pureReversColor
                layer.shadowColor = UIColor.pureColor.cgColor
                setTitleColor(UIColor.pureColor, for: .normal)
            }
        } else if themeSelect == 1 {
            backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            layer.shadowColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9647058824, alpha: 1)
            setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else if themeSelect == 2 {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
    func calculationResultThemeButton(){
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                layer.shadowColor = UIColor.pureColor.cgColor
                setTitleColor(UIColor.pureColor, for: .normal)
            }
        } else if themeSelect == 1 {
            layer.shadowColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9647058824, alpha: 1)
            setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else if themeSelect == 2 {
            layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
}
extension CAShapeLayer {
    func darkThemeLayer(){
        let give = UserDefaults.standard
        let themeSelect = give.integer(forKey: "DarkTheme")
        if themeSelect == 0 {
            if #available(iOS 13.0, *) {
                strokeColor = UIColor.pureColor.cgColor
            }
        } else if themeSelect == 1 {
            strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else if themeSelect == 2 {
            strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
