//
//  UIViewController + AlertController.swift
//  authTestTask
//
//  Created by Daniil on 22.04.2023.
//

import UIKit

extension UIViewController {
	
	func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction] = []) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		actions.forEach { alert.addAction($0) }
		
		if actions.isEmpty {
			alert.addAction(UIAlertAction(title: L10n.Alert.Actions.okAction, style: .default, handler: nil))
		}
		
		present(alert, animated: true, completion: nil)
	}
	
	func showImageAlert(title: String? = nil,
						message: String? = nil,
						actions: [UIAlertAction] = [],
						alertImage: String) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let image = UIImage(named: alertImage)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		alert.view.addSubview(imageView)
		
		let centerXconstraint = NSLayoutConstraint(item: imageView, attribute: .centerX,
												   relatedBy: .equal, toItem: alert.view,
												   attribute: .centerX, multiplier: 1,
												   constant: .zero)
		alert.view.addConstraint(centerXconstraint)
		
		let centerYconstraint = NSLayoutConstraint(item: imageView, attribute: .centerY,
												   relatedBy: .equal, toItem: alert.view,
												   attribute: .centerY, multiplier: 1,
												   constant: .zero)
		alert.view.addConstraint(centerYconstraint)
		
		let widthConstraint = NSLayoutConstraint(item: imageView, attribute: .width,
												 relatedBy: .equal, toItem: nil,
												 attribute: .notAnAttribute, multiplier: 1,
												 constant: 44)
		
		alert.view.addConstraint(widthConstraint)
		
		let heightConstraint = NSLayoutConstraint(item: imageView, attribute: .height,
												  relatedBy: .equal, toItem: nil,
												  attribute: .notAnAttribute, multiplier: 1,
												  constant: 44)
		alert.view.addConstraint(heightConstraint)
		
		actions.forEach { alert.addAction($0) }
		
		if actions.isEmpty {
			alert.addAction(UIAlertAction(title: L10n.Alert.Actions.okAction, style: .default, handler: nil))
		}
		
		present(alert, animated: true, completion: nil)
	}
}
