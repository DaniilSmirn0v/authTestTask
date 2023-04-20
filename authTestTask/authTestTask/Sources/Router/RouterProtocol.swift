//
//  RouterProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol RouterProtocol {
	func initialViewController()
	func presentAuthViewController()
	func displayPhotosViewController()
	func pushToDetailInfoModule()
	func popToRootViewController()
}
