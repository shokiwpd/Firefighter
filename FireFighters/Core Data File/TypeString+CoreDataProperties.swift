import Foundation
import CoreData
import UIKit

extension TypeString {
    class func getDataInfo() -> NSManagedObject {
        let AppDelegete = UIApplication.shared.delegate as! AppDelegate
        let Context = AppDelegete.persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "TypeString", in: Context)
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
        return (NSEntityDescription.insertNewObject(forEntityName: "TypeString", into: Context))
    }
}
