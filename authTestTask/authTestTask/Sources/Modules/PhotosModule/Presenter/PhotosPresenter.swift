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
	private var networkService: NetworkServiceProtocol
	
	// MARK: - Initialize
	
	init(router: RouterProtocol, networkService: NetworkServiceProtocol) {
		self.router = router
		self.networkService = networkService
	}
	
	// MARK: - PhotosPresenterInputProtocol API
	
	func fetchAlbumPhotos(completion: (Void)?) {
		let requestType = FetchAlbumPhotosAPI.fetchAlbumData
		networkService.fetchPhotoAlbumData(request: requestType) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let data):
				print(data.response.items.count)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func exitButtonTapped() {
		router.logoutFromApp()
	}
}
