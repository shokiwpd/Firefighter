//
//  getFirebaseData.swift
//  FireFighters
//
//  Created by Павел on 21.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation

class loadFirebaseData {
    var userInfo = UserProfile.userInform
    
    func userData(data: NSDictionary!) {
        guard let user:NSDictionary = data else { return print("errorLoadData")}
        userInfo.userName = user["name"] as! String
        userInfo.userPatronymic = user["patronymic"]  as! String
        userInfo.userCity = user["city"] as! String
        userInfo.userPosition = user["position"] as! String
        userInfo.userPartNum = user["partNumb"] as! String
        userInfo.userChange = user["changeNum"] as! Int
        userInfo.userBirthday = user["birthDay"]  as! String
        userInfo.userUnitType = user["unitType"]  as! String
        userInfo.userVBallons = user["vBallons"] as! Double
        userInfo.userAirFlow = user["airFlow"] as! Double
        userInfo.userAspectRatio = user["aspectRatio"] as! Double
        userInfo.userGearboxOperation = user["gearboxOperation"] as! Int
    }
}
