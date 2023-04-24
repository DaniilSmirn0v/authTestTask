//
//  AppDelegate.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit
import VK_ios_sdk

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		guard let window = window else { return false }
		setup(window)
		
		return true
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
		VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
		
		return true
	}
}

extension AppDelegate {
	private func setup(_ window: UIWindow) {
		let navigationController = UINavigationController()
		
		let authService = AuthService()
		authService.wakeUpSession()
		
		let router = BaseRouter(navigationController: navigationController, authService: authService)
		router.initialViewController()
		
		window.rootViewController = navigationController
		window.overrideUserInterfaceStyle = .light
		window.makeKeyAndVisible()
	}
}
