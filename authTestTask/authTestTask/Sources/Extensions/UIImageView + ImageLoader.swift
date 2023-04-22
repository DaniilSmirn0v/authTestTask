//
//  UIImageView + ImageLoader.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import UIKit

extension UIImageView {
	
	func getImage(for url: String) {
		return ImageLoader.shared.getImage(from: url) { [weak self] image in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.image = image
			}
		}
	}
}
