//
//  DetailInfoPresenterInputProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol DetailInfoPresenterInputProtocol {
	func prevImageData()
	func nextImageData()
	func configureViewWithCurrentViewModel()
	func updateCurrentPhoto(index: Int)
	func currentIndex() -> Int
	func popToPhotosViewController()
}
