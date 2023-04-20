//
//  BaseRouter.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit
import VK_ios_sdk

final class BaseRouter: RouterProtocol {
	
	// MARK: - Properties
	
	private var navigationController: UINavigationController
	private var authService: AuthServiceProtocol
	
	// MARK: - Initialize
	
	init(navigationController: UINavigationController, authService: AuthServiceProtocol) {
		self.navigationController = navigationController
		self.authService = authService
		authService.delegate = self
	}
	
	// MARK: - RouterProtocol methods
	
	func initialViewController() {
		authInit()
	}
	
	func presentAuthViewController() {
		authService.authStart()
	}
	
	func displayPhotosViewController() {
		authServiceDidFinish()
	}
	
	func pushToDetailInfoModule() {
		let detailInfoViewController = DetailInfoModuleAssembly.configureDetailInfoModule(router: self)
		navigationController.pushViewController(detailInfoViewController, animated: true)
	}
	
	func popToRootViewController() {
		navigationController.popViewController(animated: true)
	}
	
	func logoutFromApp() {
		authService.authEndSession()
	}
}

extension BaseRouter: AuthServiceDelegate {
	func authInit() {
		let loginViewController = LoginModuleAssembly.configureLoginModule(router: self)
		navigationController.setViewControllers([loginViewController], animated: true)
	}
	
	func authServiceShouldPresent(viewController: UIViewController) {
		let authNavigationController = UINavigationController(rootViewController: viewController)
		if let sheet = authNavigationController.sheetPresentationController {
			sheet.detents = [.large()]
		}
		
		navigationController.present(authNavigationController, animated: true)
	}
	
	func authServiceDidFinish() {
		let photosViewController = PhotosModuleAssembly.configurePhotosModule(router: self)
		navigationController.setViewControllers([photosViewController], animated: true)
	}
	
	func authServiceDidFail(with error: Error) {
		let alertVC = UIAlertController(title: "Ошибошка", message: error.localizedDescription, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "Окей", style: .default, handler: { [weak self] _ in
			self?.authUserDidLogOut()
		})
		
		alertVC.addAction(okAction)
		
		navigationController.present(alertVC, animated: true)
	}
	
	func authUserDidLogOut() {
		
		let alertVC = UIAlertController(title: "Вы уверены, что хотите выйти?", message: nil, preferredStyle: .alert)
		let exitAction = UIAlertAction(title: "Выйти", style: .destructive) { _ in
			VKSdk.forceLogout()
			let loginViewController = LoginModuleAssembly.configureLoginModule(router: self)
			self.navigationController.setViewControllers([loginViewController], animated: true)
		}
		
		let cancelAction = UIAlertAction(title: "Отмена", style: .default)
		alertVC.addAction(exitAction)
		alertVC.addAction(cancelAction)
		navigationController.present(alertVC, animated: true)
		
	}
}
