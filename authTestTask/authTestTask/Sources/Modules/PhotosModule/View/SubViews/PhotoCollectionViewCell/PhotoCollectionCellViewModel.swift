//
//  PhotoCollectionCellViewModel.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import Foundation

final class PhotoCollectionCellViewModel: CellIdentifiable, ViewModel {
	
	// MARK: - Properties
	
	var cellIdentifier = String(describing: PhotoCollectionCellViewModel.self)
	let id: Int
	let date: String
	let image: String
	
	// MARK: - Initialize
	
	init(id: Int, date: String, image: String) {
		self.id = id
		self.date = date
		self.image = image
	}
}
