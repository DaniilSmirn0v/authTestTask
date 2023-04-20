//
//  PhotosPresenter.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

final class PhotosPresenter: PhotosPresenterInputProtocol {
	// MARK: - Properties
	weak var view: PhotosPresenterOutputProtocol?
	private let router: RouterProtocol
	
	// MARK: - Initialize
	init(router: RouterProtocol) {
		self.router = router
	}
	
	// MARK: - PhotosPresenterInputProtocol API
}
