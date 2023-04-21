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
				self.prepareDataToConfigureCell(response: data)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func exitButtonTapped() {
		router.logoutFromApp()
	}
}

// MARK: - Private methods

extension PhotosPresenter {
	private func prepareDataToConfigureCell(response: ResponsePhotos) {
		let cellViewModels: [PhotoCollectionCellViewModel] = response.response.items.map {
			return PhotoCollectionCellViewModel(image: $0.sizes.last?.url ?? "")
		}
		view?.configureView(with: cellViewModels)
	}
}
