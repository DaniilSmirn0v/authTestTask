//
//  CellIdentifiable.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import UIKit

protocol CellIdentifiable {
	var cellIdentifier: String { get }
}

protocol BaseCell {
	func configure(with model: CellIdentifiable?)
}

class BaseCollectionViewCell: UICollectionViewCell, BaseCell {
	func configure(with model: CellIdentifiable?) { }
}
