//
//  PhotoCollectionCellViewModel.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import Foundation

class PhotoCollectionCellViewModel: CellIdentifiable {
	
	// MARK: - Properties
	
	var cellIdentifier = String(describing: PhotoCollectionCellViewModel.self)
	let image: String
	
	// MARK: - Initialize
	
	init(image: String) {
		self.image = image
	}
}
