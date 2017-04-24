//
//  AppDelegate.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/13/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Sets up Google PlacePicker API:
        GMSPlacesClient.provideAPIKey("AIzaSyChRa0g9ZpPTw0HbU7_llgPHF6xNuwyskg")
        GMSServices.provideAPIKey("AIzaSyChRa0g9ZpPTw0HbU7_llgPHF6xNuwyskg")
        
        //Sets up Firebase app:
        FIRApp.configure()
        
        // set up onboarding:
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var whichView: UIViewController
        

        if (UserDefaults.standard.value(forKey: "email") as? String) == nil {
            // show the onboarding screen because email is nil
            whichView = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        } else {
            // show the main screen
            whichView = storyboard.instantiateInitialViewController()!
            //exclamation point ok because we definitely have a main viewcontroller
        }
        
        self.window?.rootViewController = whichView
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

