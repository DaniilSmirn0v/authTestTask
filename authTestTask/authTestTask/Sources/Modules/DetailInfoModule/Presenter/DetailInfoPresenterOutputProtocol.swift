//
//  DetailInfoPresenterOutputProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol DetailInfoPresenterOutputProtocol: AnyObject {
	func configureView(with viewModel: ViewModel)
	func configureCollectionView(with viewModels: [ViewModel])
	func didSelectCell(with index: Int)
}
