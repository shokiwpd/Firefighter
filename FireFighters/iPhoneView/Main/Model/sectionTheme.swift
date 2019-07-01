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
        let typeCheking = TypeString.TypeStrings
    let firstCheck  = ThemeModel(nameTheme: "Первая проверка", optionaltext: typeCheking.nameType!)
    let workCheck = ThemeModel(nameTheme: "Рабочая проверка", optionaltext: typeCheking.nameType!)
    let typeInfo = ThemeModel(nameTheme: "ТТХ Аппарата", optionaltext: typeCheking.nameType!)
    let chargePoinstsman = ThemeModel(nameTheme: "Обязанности постового", optionaltext: "Документ")
    let fireFightersChange = ThemeModel(nameTheme: "Обязанности ГДЗ", optionaltext: "Документ")
    let orderNumberThree = ThemeModel(nameTheme: "Приказ № 3", optionaltext: "Документ")
        if typeCheking.nameType != "Прочие"{
            return [firstCheck, workCheck,typeInfo, chargePoinstsman, fireFightersChange,orderNumberThree]}
        else {
            return [firstCheck, workCheck, chargePoinstsman, fireFightersChange,orderNumberThree]
        }
    }
}
struct ConstantCell {
    static let leftToView: CGFloat = 78
    static let rightToView: CGFloat = 78
    static let minimumLine: CGFloat = 10
    static let cellWidth = (UIScreen.main.bounds.width - ConstantCell.leftToView + ConstantCell.rightToView - (ConstantCell.minimumLine / 2)) / 2
}
