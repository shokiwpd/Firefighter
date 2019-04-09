//
//  sectionTheme.swift
//  FireFighters
//
//  Created by Павел on 18/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import Foundation
import UIKit
// Нормативные правила проверки работы СИЗОД и обязанности постового на посту безопасности!

struct ThemeModel {
    let nameTheme: String! // Название проверка/обязанности
    let optionaltext: String! // К какому разделу относится

static func fetchThemeSection() -> [ThemeModel] {
    let typeUserDef = UserDefaults.standard.integer(forKey: "TypeUser")
    var typeName = ""
    switch typeUserDef {
    case 0:
        typeName = "AUER"
    case 1:
        typeName = "OMEGA"
    case 2:
        typeName = "GDZS"
    default: break
    }
    let firstCheck  = ThemeModel(nameTheme: "Первая проверка", optionaltext: typeName)
    let workCheck = ThemeModel(nameTheme: "Рабочая проверка", optionaltext: typeName)
    let typeInfo = ThemeModel(nameTheme: "ТТХ Аппарата", optionaltext: typeName)
    let chargePoinstsman = ThemeModel(nameTheme: "Обязанности постового", optionaltext: "Документ")
    let fireFightersChange = ThemeModel(nameTheme: "Обязанности ГДЗ", optionaltext: "Документ")
    let orderNumberThree = ThemeModel(nameTheme: "Приказ № 3", optionaltext: "Документ")
    return [firstCheck, workCheck,typeInfo, chargePoinstsman, fireFightersChange,orderNumberThree]
    }
}
struct ConstantCell {
    static let leftToView: CGFloat = 78
    static let rightToView: CGFloat = 78
    static let minimumLine: CGFloat = 10
    static let cellWidth = (UIScreen.main.bounds.width - ConstantCell.leftToView + ConstantCell.rightToView - (ConstantCell.minimumLine / 2)) / 2
}
