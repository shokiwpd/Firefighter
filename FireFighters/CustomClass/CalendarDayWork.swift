//
//  CalendarDayWork.swift
//  FireFighters
//
//  Created by Павел on 29.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import Foundation


class MonthWork {
   // print(DayMoth)
    let Dec = ["28:12:2017":2,"29:12:2017":3,"30:12:2017":4,"31:12:2017":1]
    let Jun = ["01:01:2018":2,"02:01:2018":3,"03:01:2018":4,"04:01:2018":1,"05:01:2018":2,"06:01:2018":3,"07:01:2018":4,"08:01:2018":1,"09:01:2018":2,"10:01:2018":3,"11:01:2018":4,"12:01:2018":1,"13:01:2018":2,"14:01:2018":3,"15:01:2018":4,"16:01:2018":1,"17:12:2018":2,"18:01:2018":3,"19:01:2018":4,"20:01:2018":1,"21:01:2018":2,"22:01:2018":3,"23:01:2018":4,"24:01:2018":1,"25:01:2018":2,"26:01:2018":3,"27:01:2018":4,"28:01:2018":1,"29:01:2018":2,"30:01:2018":3,"31:01:2018":4]
    
    func Month(MonthNum: String) -> [String: Int]{
        
        var MonthNumType = [String: Int]()
        switch MonthNum {
        case "01": MonthNumType = Jun
        case "12": MonthNumType = Dec
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
//TestCalendar
