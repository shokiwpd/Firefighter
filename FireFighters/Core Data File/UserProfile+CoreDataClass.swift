//
//  UserProfile+CoreDataClass.swift
//  FireFighters
//
//  Created by Павел on 06.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

class UserProfile {
    
    static let userInform = UserProfile()
    static let sharedUserProfile = UserProfile.getProfileInfo()
    let usersInform = UserProfile.sharedUserProfile

    var userName: String! {
        get {
            return usersInform.value(forKey: "userName") as? String ?? ""
         }
        set {
            usersInform.setValue(newValue, forKey: "userName")
        }
    }
    var userPatronymic: String! {
        get {
            return usersInform.value(forKey: "userPatronymic") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userPatronymic")
        }
    }
    var userCity: String! {
        get {
            return usersInform.value(forKey: "userCity") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userCity")
        }
    }
    var userBirthday: String! {
        get {
            return usersInform.value(forKey: "userBirthday") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userBirthday")
        }
    }
    var userPartNum: String! {
        get {
            return usersInform.value(forKey: "userPartNum") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userPartNum")
        }
    }
    var userPosition: String! {
        get {
            return usersInform.value(forKey: "userPosition") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userPosition")
        }
    }
    var userChange: String! {
        get {
            return usersInform.value(forKey: "userChange") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userChange")
        }
    }
    var userPhoto: UIImage {
        get {
            if let data = usersInform.value(forKey: "userPhoto") as? NSData {
                return UIImage(data: data as Data) ?? UIImage(named: "defPhoto")!
            }
            return UIImage(named: "defPhoto")!
        }
        set {
            usersInform.setValue(UIImageJPEGRepresentation(newValue, 0.5), forKey: "userPhoto")
        }
    }
    var userUnitType: String {
        get {
            return usersInform.value(forKey: "userUnitType") as? String ?? ""
        }
        set {
            usersInform.setValue(newValue, forKey: "userUnitType")
        }
    }
    
}
