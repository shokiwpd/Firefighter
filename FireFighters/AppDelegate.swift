//
//  AppDelegate.swift
//  FireFighters
//
//  Created by Павел on 21.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseMessaging
import FirebaseInstanceID
import IQKeyboardManagerSwift
import UserNotifications
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var DeviceInfo: UIDevice!
    var DeviceOreintation: UIDeviceOrientation!
    var connectStatus = Reachability()!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            //Parse errors and track state
        }
        application.registerForRemoteNotifications()
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if (Auth.auth().currentUser?.uid) == nil {
            window?.rootViewController = UIStoryboard(name: "authStoryBoard", bundle: nil).instantiateInitialViewController() as! AuthAndRegistrationView
        } else {
            if UserProfile.userInform.userName.isEmpty{
            window?.rootViewController = UIStoryboard(name: "authStoryBoard", bundle: nil).instantiateInitialViewController() as! AuthAndRegistrationView
        } else {
            window?.rootViewController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        }
            
    }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        self.saveContext()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        self.saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Print message ID.
        if let messageID = userInfo["alert"] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print("%@", userInfo)
        print(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
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

