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
	
	func pushToDetailInfoModule(with currentViewModelIndex: Int, viewModels: [ViewModel]) {
		let detailInfoViewController = DetailInfoModuleAssembly.configureDetailInfoModule(with: currentViewModelIndex,
																						  viewModels: viewModels,
																						  router: self)
		navigationController.pushViewController(detailInfoViewController, animated: true)
	}
	
	func popToRootViewController() {
		navigationController.popViewController(animated: true)
	}
	
	func logoutFromApp() {
		authService.authEndSession()
	}
}

// MARK: - AuthServiceDelegate

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
		
		let alertVC = UIAlertController(title: L10n.Alert.errorTitle, message: L10n.AuthError.unknownError, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: L10n.Alert.Actions.okAction, style: .default)
		
		alertVC.addAction(okAction)
		
		navigationController.present(alertVC, animated: true)
	}
	
	func authUserDidLogOut() {
		
		let alertVC = UIAlertController(title: L10n.Alert.exitMessage, message: nil, preferredStyle: .alert)
		let exitAction = UIAlertAction(title: L10n.Alert.Actions.extiAction, style: .destructive) { _ in
			VKSdk.forceLogout()
			let loginViewController = LoginModuleAssembly.configureLoginModule(router: self)
			self.navigationController.setViewControllers([loginViewController], animated: true)
		}
		
		let cancelAction = UIAlertAction(title: L10n.Alert.Actions.cancelAction, style: .default)
		
		[exitAction, cancelAction].forEach { alertVC.addAction($0) }
		
		navigationController.present(alertVC, animated: true)
	}
}
