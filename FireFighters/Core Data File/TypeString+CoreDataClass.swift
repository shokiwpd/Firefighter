//
//  TypeString+CoreDataClass.swift
//  
//
//  Created by Павел on 23/04/2019.
//
//

import Foundation
import CoreData

public class TypeString {
    static let TypeStrings = TypeString()
    static let sharedType = TypeString.getDataInfo()
    let TypeStringData = TypeString.sharedType
    
    var nameType: String! {
        get {
            return TypeStringData.value(forKey: "nameType") as? String ?? ""
        }
        set {
            TypeStringData.setValue(newValue, forKey: "nameType")
        }
    }
}
