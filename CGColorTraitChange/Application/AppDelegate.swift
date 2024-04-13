//
//  AppDelegate.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Combine
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var environment = AppEnvironment.setup()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = ThemeStore.theme.getUserInterfaceStyle()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        window?.overrideUserInterfaceStyle = ThemeStore.theme.getUserInterfaceStyle()
    }
}
