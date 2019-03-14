//
//  CustomDate.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    var TimeFormat: String {
        let formDate = DateFormatter()
        formDate.dateFormat = "HH:mm"
        return formDate.string(from: self)
    }
    var HourTime: String {
        let formDate = DateFormatter()
        formDate.dateFormat = "HH"
        return formDate.string(from: self)
    }
    var DayAndMonth: String {
        let formDate = DateFormatter()
        formDate.dateFormat = "dd:MM"
        return formDate.string(from: self)
    }
}
