//
//  BaseRouter.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class BaseRouter: RouterProtocol {
	
	//MARK: - Properties
	private var navigationController: UINavigationController
	
	//MARK: - Initialize
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	//MARK: - RouterProtocol methods
	func initialViewController() {
		let loginViewController = LoginModuleAssembly.configureLoginModule(router: self)
		navigationController.viewControllers = [loginViewController]
	}
	
	func presentAuthViewController() {
		let authViewController = AuthViewController(urlString: "https://www.google.com/")
		navigationController.present(authViewController, animated: true)
	}
	
	func displayPhotosViewController() {
		let photosViewController = PhotosModuleAssembly.configurePhotosModule(router: self)
		//		let navigationController = UINavigationController(rootViewController: photosViewController)
		self.navigationController.setViewControllers([photosViewController], animated: true)
	}
	
	func pushToDetailInfoModule() {
		let detailInfoViewController = DetailInfoModuleAssembly.configureDetailInfoModule(router: self)
		navigationController.pushViewController(detailInfoViewController, animated: true)
	}
	
	func popToRootViewController() {
		navigationController.popViewController(animated: true)
	}
	
}
