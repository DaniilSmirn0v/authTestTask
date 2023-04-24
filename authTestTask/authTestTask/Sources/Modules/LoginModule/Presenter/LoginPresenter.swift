//
//  LoginPresenter.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

final class LoginPresenter: LoginPresenterInputProtocol {
	// MARK: - Properties
	
	weak var view: LoginPresenterOutputProtocol?
	private let router: RouterProtocol
	
	// MARK: - Initialize
	
	init(router: RouterProtocol) {
		self.router = router
	}
	
	// MARK: - LoginPresenterInputProtocol API
	
	func loginButtonTapped() {
		router.presentAuthViewController()
	}
}
