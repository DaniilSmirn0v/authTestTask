//
//  PhotosPresenterOutputProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol PhotosPresenterOutputProtocol: AnyObject {
	func configureView(with viewModels: [CellIdentifiable])
	func configureViewError(_ error: String)
	func didSelectImage(with currentViewModelIndex: Int)
}
