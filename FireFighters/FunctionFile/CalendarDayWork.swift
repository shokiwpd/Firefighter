//
//  CalendarDayWork.swift
//  FireFighters
//
//  Created by Павел on 29.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import Foundation

class MonthWork {

    let Mar = ["01:03:2018":1,"02:03:2018":2,"03:03:2018":3,"04:03:2018":4,"05:03:2018":1,"06:03:2018":2,"07:03:2018":3,"08:03:2018":4,"09:03:2018":1,"10:03:2018":2,"11:03:2018":3,"12:03:2018":4,"13:03:2018":1,"14:03:2018":2,"15:03:2018":3,"16:03:2018":4,"17:03:2018":1,"18:03:2018":2,"19:03:2018":3,"20:03:2018":4,"21:03:2018":1,"22:03:2018":2,"23:03:2018":3,"24:03:2018":4,"25:03:2018":1,"26:03:2018":2,"27:03:2018":3,"28:03:2018":4,"29:03:2018":1,"30:03:2018":2,"31:03:2018":3]
    
    func Month(MonthNum: String) -> [String: Int]{
        var MonthNumType = [String: Int]()
        switch MonthNum {
        case "03": MonthNumType = Mar
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
