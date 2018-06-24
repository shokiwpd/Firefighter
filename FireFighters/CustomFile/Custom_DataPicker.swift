//
//  CustomDataPicker.swift
//  FireFighters
//
//  Created by Павел on 13.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIDatePicker {
    func customDataPicker() {
        self.datePickerMode = .date
        self.maximumDate = Date()
    }
}
