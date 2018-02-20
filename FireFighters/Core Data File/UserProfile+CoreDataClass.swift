import Foundation
import CoreData
import UIKit

class UserProfile {
    init() {}
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
    var userChange: Int! {
        get {
            return usersInform.value(forKey: "userChange") as? Int ?? 0
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
    var userVBallons: Int {
        get {
            return usersInform.value(forKey: "userVBallons") as? Int ?? 0
        }
        set {
            usersInform.setValue(newValue, forKey: "userVBallons")
        }
    }

    var userAspectRatio: Double { //коэффициент сжатия
        get {
            return usersInform.value(forKey: "userAspectRatio") as? Double ?? 0.0
        }
        set {
            usersInform.setValue(newValue, forKey: "userAspectRatio")
        }
    }

    var userAirFlow: Double{ //расход воздуха
        get {
            return usersInform.value(forKey: "userAirFlow") as? Double ?? 0.0
        }
        set {
            usersInform.setValue(newValue, forKey: "userAirFlow")
        }
    }
    var userGearboxOperation: Int {
        get {
            return usersInform.value(forKey: "userGearboxOperation") as? Int ?? 0
        }
        set {
            usersInform.setValue(newValue, forKey: "userGearboxOperation")
        }
    }
} //давление на работу редуктора

