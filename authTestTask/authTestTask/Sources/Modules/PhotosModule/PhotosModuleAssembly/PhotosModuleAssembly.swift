//
//  PhotosModuleAssembly.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class PhotosModuleAssembly {
	static func configurePhotosModule(router: RouterProtocol) -> UIViewController {
		let networkService = NetworkService()
		let presenter = PhotosPresenter(router: router, networkService: networkService)
		let view = PhotosViewController(presenter: presenter)
		presenter.view = view
		
		return view
	}
}
