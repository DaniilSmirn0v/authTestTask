//
//  DetailInfoPresenter.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

final class DetailInfoPresenter: DetailInfoPresenterInputProtocol {
	
	// MARK: - Properties
	
	weak var view: DetailInfoPresenterOutputProtocol?
	private let router: RouterProtocol
	private var currentViewModelIndex: Int
	private let viewModels: [ViewModel]

	// MARK: - Initialize
	
	init(router: RouterProtocol,
		 currentViewModelIndex: Int,
		 viewModels: [ViewModel]) {
		self.router = router
		self.currentViewModelIndex = currentViewModelIndex
		self.viewModels = viewModels
	}
	
	// MARK: - DetailInfoPresenterInputProtocol API
	
	func prevImageData() {
		if currentViewModelIndex == 0 {
			currentViewModelIndex = viewModels.count - 1
		} else if currentViewModelIndex >= 1 {
			currentViewModelIndex -= 1
		}
		
		let viewModel = viewModels[currentViewModelIndex]
		view?.configureView(with: viewModel)
	}
	
	func nextImageData() {
		if currentViewModelIndex >= viewModels.count - 1 {
			currentViewModelIndex = 0
		} else if currentViewModelIndex < viewModels.count {
			currentViewModelIndex += 1
		}

		let viewModel = viewModels[currentViewModelIndex]
		view?.configureView(with: viewModel)
	}
	
	func configureViewWithCurrentViewModel() {
		guard let imageDataViewModel = viewModels[currentViewModelIndex] as? PhotoCollectionCellViewModel else { return }
		view?.configureView(with: imageDataViewModel)
		view?.configureCollectionView(with: viewModels)
	}
	
	func updateCurrentPhoto(index: Int) {
		guard let imageDataViewModel = viewModels[index] as? PhotoCollectionCellViewModel else { return }
		currentViewModelIndex = index
		view?.configureView(with: imageDataViewModel)
	}
	
	func currentIndex() -> Int {
		currentViewModelIndex
	}
	
	func popToPhotosViewController() {
		router.popToRootViewController()
	}
}
