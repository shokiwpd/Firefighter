//
//  CalendarDayWork.swift
//  FireFighters
//
//  Created by Павел on 29.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import Foundation

class MonthWork {
    let Jun = ["01:01:2018":2,"02:01:2018":3,"03:01:2018":4,"04:01:2018":1,"05:01:2018":2,"06:01:2018":3,"07:01:2018":4,"08:01:2018":1,"09:01:2018":2,"10:01:2018":3,"11:01:2018":4,"12:01:2018":1,"13:01:2018":2,"14:01:2018":3,"15:01:2018":4,"16:01:2018":1,"17:01:2018":2,"18:01:2018":3,"19:01:2018":4,"20:01:2018":1,"21:01:2018":2,"22:01:2018":3,"23:01:2018":4,"24:01:2018":1,"25:01:2018":2,"26:01:2018":3,"27:01:2018":4,"28:01:2018":1,"29:01:2018":2,"30:01:2018":3,"31:01:2018":4]
    let Feb = ["01:02:2018":1,"02:02:2018":2,"03:02:2018":3,"04:02:2018":4,"05:02:2018":1,"06:02:2018":2,"07:02:2018":3,"08:02:2018":4,"09:02:2018":1,"10:02:2018":2,"11:02:2018":3,"12:02:2018":4,"13:02:2018":1,"14:02:2018":2,"15:02:2018":3,"16:02:2018":4,"17:02:2018":1,"18:02:2018":2,"19:02:2018":3,"20:02:2018":4,"21:02:2018":1,"22:02:2018":2,"23:02:2018":3,"24:02:2018":4,"25:02:2018":1,"26:02:2018":2,"27:02:2018":3,"28:02:2018":4]
    
    func Month(MonthNum: String) -> [String: Int]{
        var MonthNumType = [String: Int]()
        switch MonthNum {
        case "01": MonthNumType = Jun
        case "02": MonthNumType = Feb
//        case "03": MonthNumType = Mar
//        case "04": MonthNumType = Apr
//        case "05": MonthNumType = May
//        case "06": MonthNumType = Jun
//        case "07": MonthNumType = Jul
//        case "08": MonthNumType = Avg
//        case "09": MonthNumType = Sent
//        case "010": MonthNumType = Okt
            
        default:
            break
        }
        return MonthNumType
        
    }
}
class DayFormat {
    func todayDate()-> String!{
        let today = Date()
        let Forrmated = DateFormatter()
        Forrmated.dateFormat = "dd:MM:YYYY"
        let formatedDate = Forrmated.string(from: today)
        return formatedDate
    }
}