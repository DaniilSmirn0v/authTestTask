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
		guard let window = window else { return false }
		setup(window)
		
		return true
	}
	
}

extension AppDelegate {
	private func setup(_ window: UIWindow) {
		
		let navigationController = UINavigationController()
		let router = BaseRouter(navigationController: navigationController)
		router.initialViewController()
		
		window.rootViewController = navigationController
		window.overrideUserInterfaceStyle = .light
		window.makeKeyAndVisible()
	}
}
