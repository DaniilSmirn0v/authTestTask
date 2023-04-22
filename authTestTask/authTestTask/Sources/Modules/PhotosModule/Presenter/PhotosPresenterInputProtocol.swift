//
//  PhotosPresenterInputProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol PhotosPresenterInputProtocol {
	func fetchAlbumPhotos()
	func exitButtonTapped()
	func pushToDetailInfoViewController(with currentViewModelIndex: Int,
										viewModels: [ViewModel])
}
