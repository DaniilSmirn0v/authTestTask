//
//  PhotosModuleAssembly.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import UIKit

final class PhotosModuleAssembly {
	static func configurePhotosModule(router: RouterProtocol) -> UIViewController {
		let presenter = PhotosPresenter(router: router)
		let view = PhotosViewController(presenter: presenter)
		presenter.view = view
		
		return view
	}
}
