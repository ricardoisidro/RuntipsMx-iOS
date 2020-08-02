//
//  AppDelegate.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/23/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let start = LoginRouter.createLogin()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [start]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = start
        window?.makeKeyAndVisible()
        return true
    }
}
