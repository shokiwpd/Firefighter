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

struct ConstantCell {
    static let leftToView: CGFloat = 78
    static let rightToView: CGFloat = 78
    static let minimumLine: CGFloat = 10
    static let cellWidth = (UIScreen.main.bounds.width - ConstantCell.leftToView + ConstantCell.rightToView - (ConstantCell.minimumLine / 2)) / 2
}
