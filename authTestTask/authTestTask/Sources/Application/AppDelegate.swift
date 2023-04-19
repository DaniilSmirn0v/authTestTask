//
//  AppDelegate.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let rootVC = LoginViewController()
		window?.rootViewController = rootVC
		window?.overrideUserInterfaceStyle = .light
		window?.makeKeyAndVisible()
		
		return true
	}
}

