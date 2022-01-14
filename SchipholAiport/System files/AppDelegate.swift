//
//  AppDelegate.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().customNavigationBar()
        UIBarButtonItem.appearance().hideBackTitle()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

