//
//  UserProfile+CoreDataProperties.swift
//  FireFighters
//
//  Created by Павел on 06.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

extension UserProfiles {
    class func getProfileInfo() -> NSManagedObject {
        let AppDelegete = UIApplication.shared.delegate as! AppDelegate
        let Context = AppDelegete.persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "UserProfile", in: Context)
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entityDescription
        
        do {
            try Context.save()
            let objects = try Context.fetch(request)
            if objects.count > 0 {
                return objects[0] as! NSManagedObject
            }
        }
        catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        return (NSEntityDescription.insertNewObject(forEntityName: "UserProfile", into: Context))
    }
}

