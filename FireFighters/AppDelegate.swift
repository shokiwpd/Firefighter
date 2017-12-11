//
//  AppDelegate.swift
//  FireFighters
//
//  Created by Павел on 21.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        func todayDate()-> String!{
            let today = Date()
            let Forrmated = DateFormatter()
            Forrmated.dateFormat = "dd:MM:YYYY"
            let formatedDate = Forrmated.string(from: today)
            return formatedDate
        }
        print(todayDate())
        if todayDate() == "11:12:2017" {
            print("It's time today")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if UserProfile.userInform.userName.isEmpty{
            window?.rootViewController = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        } else {
            window?.rootViewController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "FireFighters")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

