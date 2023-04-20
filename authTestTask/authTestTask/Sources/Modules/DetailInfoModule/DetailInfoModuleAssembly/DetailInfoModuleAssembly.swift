//
//  DetailInfoModuleAssembly.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class DetailInfoModuleAssembly {
	static func configureDetailInfoModule(router: RouterProtocol) -> UIViewController {
		let presenter = DetailInfoPresenter(router: router)
		let view = DetailInfoViewController(presenter: presenter)
		presenter.view = view
		
		return view
	}
}
