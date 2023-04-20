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
	
	// MARK: - Initialize
	init(router: RouterProtocol) {
		self.router = router
	}
	
	// MARK: - DetailInfoPresenterInputProtocol API
}
 
