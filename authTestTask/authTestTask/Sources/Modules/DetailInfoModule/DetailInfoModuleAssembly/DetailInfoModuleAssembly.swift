//
//  DetailInfoModuleAssembly.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class DetailInfoModuleAssembly {
	static func configureDetailInfoModule(with currentViewModelIndex: Int,
										  viewModels: [ViewModel],
										  router: RouterProtocol) -> UIViewController {
		
		let presenter = DetailInfoPresenter(router: router,
											currentViewModelIndex: currentViewModelIndex,
											viewModels: viewModels)
		
		let view = DetailInfoViewController(presenter: presenter)
		presenter.view = view
		
		return view
	}
}
