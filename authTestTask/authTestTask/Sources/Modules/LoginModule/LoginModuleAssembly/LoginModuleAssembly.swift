//
//  LoginModuleAssembly.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class LoginModuleAssembly {
	static func configureLoginModule(router: RouterProtocol) -> UIViewController {
		let presenter = LoginPresenter(router: router)
		let view = LoginViewController(presenter: presenter)
		presenter.view = view
		
		return view
	}
}
