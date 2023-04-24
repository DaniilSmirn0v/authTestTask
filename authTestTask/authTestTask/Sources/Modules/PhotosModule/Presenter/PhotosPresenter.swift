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
	
	func fetchAlbumPhotos() {
		let requestType = FetchAlbumPhotosAPI.fetchAlbumData
		networkService.fetchPhotoAlbumData(request: requestType) { [weak self] result in
			guard let self = self else { return }
			
			switch result {
			case .success(let data):
				self.prepareDataToConfigureCell(response: data)
			case .failure(let error):
				self.prepareErrorToConfigureView(error: error)
			}
		}
	}
	
	func exitButtonTapped() {
		router.logoutFromApp()
	}
	
	func pushToDetailInfoViewController(with currentViewModelIndex: Int, viewModels: [ViewModel]) {
		router.pushToDetailInfoModule(with: currentViewModelIndex, viewModels: viewModels)
	}
}

// MARK: - Private methods

extension PhotosPresenter {
	private func prepareDataToConfigureCell(response: ResponsePhotos) {
		let cellViewModels: [PhotoCollectionCellViewModel] = response.response.items.map {
			return PhotoCollectionCellViewModel(id: $0.id,
												date: formatted($0.date),
												image: $0.sizes.last?.url ?? "")
		}
		
		view?.configureView(with: cellViewModels)
	}
	
	private func prepareErrorToConfigureView(error: Error) {
		guard let error = error as? NetworkError else { return }
		view?.configureViewError(error.errorDescription)
	}
	
	private func formatted(_ date: Int) -> String {
		let currentDate = Date(timeIntervalSince1970: Double(date))
		let formatter = DateFormatter()
		formatter.locale = .current
		formatter.dateFormat = "d MMMM yyyy"
		
		return formatter.string(from: currentDate)
	}
}
