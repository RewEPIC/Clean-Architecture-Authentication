//
//  AppDelegate.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let rootNC = UINavigationController(
            rootViewController: LoginBuilder.build(parameter: nil)
        )
        rootNC.isNavigationBarHidden = true
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
        return true
    }


}

