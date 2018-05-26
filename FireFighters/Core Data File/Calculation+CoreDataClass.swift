//
//  Calculation+CoreDataClass.swift
//  
//
//  Created by Павел on 28.02.18.
//
//

import Foundation
import CoreData


public class CalculationInfo {
    static let CalculationInform = CalculationInfo()
    static let sharedUserProfile = CalculationInfo.getDataInfo()
    let CalculationData = CalculationInfo.sharedUserProfile
    
    var FireFighter1: Int! {
        get {
            return CalculationData.value(forKey: "FireFighter1") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "FireFighter1")
        }
    }
    var FireFighter2: Int! {
        get {
            return CalculationData.value(forKey: "FireFighter2") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "FireFighter2")
        }
    }
    
    var FireFighter3: Int! {
        get {
            return CalculationData.value(forKey: "FireFighter3") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "FireFighter3")
        }
    }
    var FireFighter4: Int! {
        get {
            return CalculationData.value(forKey: "FireFighter4") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "FireFighter4")
        }
    }
    var FireFighter5: Int! {
        get {
            return CalculationData.value(forKey: "FireFighter5") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "FireFighter5")
        }
    }
    var p1Hearth: Int! {
        get {
            return CalculationData.value(forKey: "p1Hearth") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "p1Hearth")
        }
    }
    var p2Hearth: Int! {
        get {
            return CalculationData.value(forKey: "p2Hearth") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "p2Hearth")
        }
    }
    var p3Hearth: Int! {
        get {
            return CalculationData.value(forKey: "p3Hearth") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "p3Hearth")
        }
    }
    var p4Hearth: Int! {
        get {
            return CalculationData.value(forKey: "p4Hearth") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "p4Hearth")
        }
    }
    var p5Hearth: Int! {
        get {
            return CalculationData.value(forKey: "p5Hearth") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "p5Hearth")
        }
    }
    var numberFireFighter: Int! {
        get {
            return CalculationData.value(forKey: "numberFireFighter") as? Int ?? 0
        }
        set {
            CalculationData.setValue(newValue, forKey: "numberFireFighter")
        }
    }
    
    var complexityStatus: Bool! {
        get {
            return CalculationData.value(forKey: "complexityStatus") as? Bool 
        }
        set {
            CalculationData.setValue(newValue, forKey: "complexityStatus")
        }
    }
    var inputTime: Date! {
        get {
            return CalculationData.value(forKey: "inputTime") as? Date
        }
        set {
            CalculationData.setValue(newValue, forKey: "inputTime")
        }
    }
    var heartFoundTime: Date! {
        get {
            return CalculationData.value(forKey: "heartFoundTime") as? Date

        }
        set {
            CalculationData.setValue(newValue, forKey: "heartFoundTime")
        }
    }
    
    func claenData(){
        FireFighter1 = nil
        FireFighter2 = nil
        FireFighter3 = nil
        FireFighter4 = nil
        FireFighter5 = nil
            p1Hearth = nil
            p2Hearth = nil
            p3Hearth = nil
            p4Hearth = nil
            p5Hearth = nil
        numberFireFighter = nil
        complexityStatus = nil
    }

}
