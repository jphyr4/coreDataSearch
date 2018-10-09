//
//  AppDelegate.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//


import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
    lazy var containers: NSPersistentContainer = {
        let c = NSPersistentContainer(name: "Documents")
        c.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("error \(error), \(error.userInfo)")
            }
        })
        return c
    }()
    
    
    
    func saveData () {
        let data = containers.viewContext
        if data.hasChanges {
            do {
                try data.save()
            } catch {
                
                let errors = error as NSError
                fatalError("Unresolved error \(errors), \(errors.userInfo)")
            }
        }
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
        
        self.saveData()
    }

    

 

}

