//
//  AppDelegate.swift
//  AdjustExample-FBAEM
//
//  Created by Aditi Agrawal on 13/06/22.
//

import UIKit
import Adjust

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        let appToken = "2fm9gkqubvpc"
        let environment = ADJEnvironmentSandbox
        let adjustConfig = ADJConfig(appToken: appToken, environment: environment)
        
        // Change the log level.
        adjustConfig?.logLevel = ADJLogLevelVerbose
        
        // Initialise the SDK.
        Adjust.appDidLaunch(adjustConfig!)
        return true
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        NSLog("Scheme based deep link opened an app: %@", url.absoluteString)
        // Pass deep link to Adjust in order to potentially reattribute user.
        Adjust.appWillOpen(url)
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if (userActivity.activityType == NSUserActivityTypeBrowsingWeb) {
            NSLog("Universal link opened an app: %@", userActivity.webpageURL!.absoluteString)
            // Pass deep link to Adjust in order to potentially reattribute user.
            Adjust.appWillOpen(userActivity.webpageURL!)
        }
        return true
    }
}

